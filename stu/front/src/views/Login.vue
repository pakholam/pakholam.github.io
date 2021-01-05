<template>
	<div class="Login">
		<el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form" autocomplete="on" label-width="100px">
			<el-form-item label="用户名" prop="stid">
				<el-input ref="stid" v-model="loginForm.stid" placeholder="请输入学生号" name="stid" type="text" tabindex="1" autocomplete="off"/>
			</el-form-item>
		<!-- 输入密码 -->
			<el-form-item label="密码" prop="pwds">
				<el-input :key="passwordType" ref="pwds" v-model="loginForm.pwds" :type="passwordType" placeholder="请输入密码" name="pwds" tabindex="2" autocomplete="on" @blur="capsTooltip = false" @keyup.enter.native="handleLogin"/>
				<span class="el-icon-view show-pwd" @click="showPwd"></span>
			</el-form-item>
			<el-form-item>
				<el-button :loading="loading" type="primary" @click.native.prevent="handleLogin">登录</el-button>
				<el-button type="warning" @click="resetForm('loginForm')">重置</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
import axios from '../axios/index.js'
export default {
	name: 'Login',
	props: {
		msg: String
	},
	data () {
		return {
			loginForm: {
				stid: '',
				pwds: ''
			},
	  // 用户名和密码规则
			loginRules: {
				stid: [
					{ required: true, trigger: 'change' },
					{ min: 1, max: 15, message: '请输入正确学生号', trigger: 'blur' }
				],
				pwds: [
					{ required: true, trigger: 'change' },
					{ min: 1, max: 10, message: '密码须为1-10个字符', trigger: 'blur' }
				]
			},
			passwordType: 'password',
			capsTooltip: false,
			loading: false,
			showDialog: false,
			redirect: undefined,
			otherQuery: {},
			checked: false
		}
	},
	mounted () {
	// 如果输入框为空聚焦输入框
		if (this.loginForm.stid === '') {
			this.$refs.stid.focus()
		} else if (this.loginForm.pwds === '') {
			this.$refs.pwds.focus()
		};
		this.getCookie()
	},
	methods: {
		showPwd () {
			if (this.passwordType === 'password') {
				this.passwordType = ''
			} else {
				this.passwordType = 'password'
			}
	  // 点完显示密码后聚焦输入框
			this.$nextTick(() => {
				this.$refs.pwds.focus()
			})
		},
		resetForm(formName) {
			this.$refs[formName].resetFields()
			console.log('reset')
		},
	// 登录按钮
		handleLogin () {
			this.$refs.loginForm.validate((valid) => {
				if (valid) {
					console.log(this.loginForm)
					this.$ajax.post('/login2',this.loginForm)
					.then((res) => {
						if (res.data) {
							this.$store.dispatch('login', res.data)
							.then(() => {
								this.$notify({
									type: 'success',
									message: '欢迎您,' + res.data.name + '!',
									duration: 3000
								})
								this.$router.replace('/')
							})
						} else {
							this.$message({
								type: 'error',
								message: '用户名或密码错误',
								showClose: true
							})
						}
					}).catch((err) => {
						this.$message({
							type: 'error',
							message: '网络错误，请重试',
							showClose: true
						})
					})
				} else {
					return false
				}
			})
		},
	},
}
</script>

<style>
</style>
