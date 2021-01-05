from flask import Flask, request
from flask_cors import CORS
import datetime, json
import cx_Oracle
import os
import time


app = Flask(__name__)
app.config.update(DEBUG=False)
CORS(app, supports_credentials=True, resources=r'/*')


os.environ['NLS_LANG'] = 'SIMPLIFIED CHINESE_CHINA.UTF8'


class DateEncoder(json.JSONEncoder):
    # 处理时间格式与json。dumps冲突
    def default(self, obj):
        if isinstance(obj, datetime.datetime):
            return obj.strftime("%Y-%m-%d %H:%M:%S")
        else:
            return json.JSONEncoder.default(self, obj)


class user_init:
    def __init__(self):
        self.connect = cx_Oracle.connect('scott', '123456', 'localhost:1521/ORCL')
        self.cursor = self.connect.cursor()

    def disconnect(self):
        # 关闭数据库
        pass


    def login(self, data):
        # 规定字段为： stid， pwds
        stid = data['stid']
        pwds = data['pwds']

        sql = """select * from STUDENT where stid = '{}' and pwds = '{}'""".format(stid, pwds)
        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            time.sleep(0.25)
            if len(result) == 1:
                redict = {
                    "code": 200,
                    "stid": result[0][0],
                    "name": result[0][1],
                    "age": result[0][2],
                    "sex": result[0][3]
                }
                return redict
            else:
                redict = {
                    "code": 400,
                    "stid": None,
                    "name": None,
                    "age": None,
                    "sex": None
                }
                return redict
        except Exception as e:
            print(e)
            redict = {
                "code": 400,
                "stid": None,
                "name": None,
                "age": None,
                "sex": None
            }
            return redict
        finally:
            self.disconnect()

    # 分页查询所有
    def SelectOll(self,  data):
        stid = data['stid']
        sql = "select * from course"
        lists = []
        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            col_name = self.cursor.description
            for row in result:
                dicts = {}
                for col in range(len(col_name)):
                    key = col_name[col][0]
                    value = row[col]
                    dicts[key] = value
                lists.append(dicts)
                redicts = {
                    "data": lists
                }
            return redicts
        except Exception as e:
            print(e)
        finally:
            self.disconnect()
        

    # 传入学生id,返回学生已选课程
    def Selected(self, data):
        stid = data["stid"]
        print(stid)
        sql = """select s.cid,c.name,c.credit from SC s,COURSE c where s.cid = c.cid and "STID" = '{}'""".format(stid)
        print(sql)
        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            col_name = self.cursor.description
            time.sleep(0.25)
            newlist = []
            count = 0
            for row in result:
                print(row)
                dicts1 = {}
                for col in range(len(col_name)):
                    key = col_name[col][0]
                    value = row[col]
                    dicts1[key] = value
                newlist.append(dicts1)
                count += dicts1["CREDIT"]
            newdict = {"data": newlist,"count": count}
            return newdict
        except Exception as e:
            print(e)
            return {}
        finally:
            self.disconnect()


    # 学生传入sid和stid，学生添加课程
    def addSelected(self, data):
        cid = data["cid"]
        stid = data["stid"]
        sql = """select * from SC where cid = '{}' and stid = '{}'""".format(cid, stid)
        self.cursor.execute(sql)
        result = self.cursor.fetchall()
        time.sleep(0.25)
        if len(result) != 0:
            print("已选该课程")
            return {"code": '400', "re": '已选该课程'}
        w = self.Selected({"stid":stid})
        # 判断学生的学分是已经够分数了，够了直接返回无法选课
        f = w['count']
        if f >= 19:
            print("分数已满19")
            return {"code": '401', "re": '分数已满19'}

        # 查询当前的sid的分数，如果加上f也够，也无法选课
        sql = """select credit from COURSE where cid = '{}'""".format(cid)
        self.cursor.execute(sql)
        credit = self.cursor.fetchall()
        time.sleep(0.25)
        newcredit = credit[0][0]
        if newcredit + f > 19:
            print("分数够了")
            return {"code": '402', "re": '分数够了'}

        # 满足条件，直接添加课程
        sql = "insert into SC(stid, cid) values(:stid, :cid)"
        self.cursor.executemany(sql, [(stid, cid), ])
        time.sleep(0.25)
        self.connect.commit()
        print("成功选课")
        return {"code": '200', "re": '成功选课'}

    # 退课功能
    def delSelected(self, data):
        cid = data["cid"]
        stid = data["stid"]
        # 退课功能
        sql = """delete from SC where stid = '{}' and cid = '{}'""".format(stid, cid)
        print(sql)
        try:
            self.cursor.execute(sql)
            time.sleep(0.25)
            self.cursor.execute('commit')
            self.connect.commit()
            print("退课成功")
            return {"code": '200'}
        except Exception as e:
            print(e)
            return {"code": '400'}


users = user_init()


@app.route('/login2', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        stid = request.form['stid']
        pwds = request.form['pwds']
        print(stid, pwds)
        return json.dumps(users.login({"stid": stid, "pwds": pwds}))
    else:
        data = request.data
        a = json.dumps(users.login(json.loads(data)))
        return a


@app.route('/home/<func>', methods=['GET', 'POST'])
def home(func):
    if func == 'OllSelect':
        stid = request.form['stid']
        print(stid)
        return json.dumps(users.SelectOll({"stid": stid}))
    elif func == 'Selected':
        if request.method == 'POST':
            stid = request.form['stid']
            print(stid)
            return json.dumps(users.Selected({"stid": stid}))
        else:
            data = request.data
            b = json.dumps(users.Selected(json.loads(data)))
            return b
    elif func == 'addSelect':
        if request.method == 'POST':
            cid = request.form['cid']
            stid = request.form['stid']
            return json.dumps(users.addSelected({"cid": cid, "stid": stid}))
        else:
            data = request.data
            c = json.dumps(users.addSelected(json.loads(data)))
            return c
    elif func == 'delSelect':
        if request.method == 'POST':
            cid = request.form['cid']
            stid = request.form['stid']
            print(cid, stid)
            return json.dumps(users.delSelected({"cid": cid, "stid": stid}))
        else:
            data = request.data
            d = json.dumps(users.delSelected(json.loads(data)))
            return d


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, threaded=True)