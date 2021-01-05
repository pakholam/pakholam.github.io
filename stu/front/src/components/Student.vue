<template>
	<div class="student">
		<h4>
			<span v-if="loginForm">
				<table>
					<tr>
					  <td>STID</td>
					  <td>SNAME</td>
					  <td>SEX</td>
					  <td>AGE</td>
					</tr>
					<tr>
					  <td>{{loginForm.stid}}</td>
					  <td>{{loginForm.name}}</td>
					  <td>{{loginForm.sex}}</td>
					  <td>{{loginForm.age}}</td>
					</tr>
				</table>
			</span>
			<span v-else>
				<el-button  type="success" @click="login" style="display: block;margin: 0 auto;">登录后查看信息</el-button>
			</span>
			<span v-if="loginForm">
				<el-form ref="userForm" :model="userForm" class="userForm" autocomplete="on">
					<el-form-item label="学生号" prop="stid">
						<el-input ref="stid" v-model="userForm.stid" placeholder="请输入学生号查询已选课程" name="stid" type="text" tabindex="1" autocomplete="off"/>
					</el-form-item>
					<el-form-item>
						<el-button :loading="loading" type="primary" @click.native.prevent="Search">查询</el-button>
					</el-form-item>
				</el-form>
			</span>
			<span v-if="loginForm">
				<el-form v-if="userForm.stid == loginForm.stid">
					<table>
						<tr>
							<td>CID</td>
							<td>CNAME</td>
							<td>CREDIT</td>
						</tr>
						<tr v-for="items in userdata.data">
							<td>{{items.CID}}</td>
							<td>{{items.NAME}}</td>
							<td>{{items.CREDIT}}</td>
						</tr>
						<tr>
							<th colspan="2">COUNT</th>
							<td colspan="2">{{userdata.count}}</td>
						</tr>
					</table>
				</el-form>	
			</span>
		</h4>
	</div>
</template>

<script>
import axios from '../axios/index.js'
export default {
	name: 'Student',
	components: {
	},
	data(){
		return{
			userForm:{
				stid: ''
			},
			loading: false,
			userdata: {},
		}
	},
	methods: {
		login () {
		    this.$router.replace('/Login')
		},
		Search: function() {
			this.$refs.userForm.validate((valid) => {
				if(valid) {
					console.log(this.userForm)
					if(this.userForm.stid == this.loginForm.stid){
						this.$ajax.post('/home/Selected',this.userForm)
						.then((res) => {
							if(res.data){
								console.log(res.data)
								this.userdata = res.data
							}else{
								this.$message({
									type: 'error',
									message: '学生号错误',
									showClose: true
								})
							}
						})
						.catch((err) => {
							this.$message({
								type: 'error',
								message: '网络错误，请重试',
								showClose: true
							})
						})
					}else{
						this.$message({
							type: 'error',
							message: '请输入本人学生号',
							showClose: true
						})
					}
				} else {
					return false
				}
			})
		},
	},
	computed: {
		loginForm () {
			  console.log(this.$store.state)
			return this.$store.state.loginForm
		}
	},
}
</script>

<style>
	table{
	  border: 1px solid #42B983;
	  margin: 0 auto;
	}
	
	td {
	  color: #42B983;
	  padding: 10px;
	}
	
</style>
