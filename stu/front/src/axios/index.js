import Vue from 'vue'
import axios  from 'axios'
import qs from 'qs'
axios.defaults.baseURL="http://localhost:5000"
Vue.prototype.$ajax = axios//重命名为ajax，使用$ajax.get即可调用

axios.defaults.headers = {
		"Content-Type": "application/x-www-form-urlencoded;charset=utf-8"
};

axios.interceptors.request.use(function (config) {
    if(config.method!='get'){
        config.data=qs.stringify(config.data);
    }
    config.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    return config;
},function (error) {
    return Promise.reject(error)
})