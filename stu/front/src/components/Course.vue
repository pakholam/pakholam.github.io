<template>
	<div class="course">
		<h4>
			<span v-if="loginForm">
				<el-form ref="courseForm" :model="courseForm" class="courseForm" autocomplete="on">
					<el-form-item>
						<el-button :loading="loading" type="primary" @click.native.prevent="Search">查询</el-button>
					</el-form-item>
				</el-form>
			</span>
			<span v-else>
				<el-button type="success" @click="login" style="display: block;margin: 0 auto;">登录后查看信息</el-button>
			</span>
			<span v-if="loginForm">
				<table>
					<tr>
						<td>CID</td>
						<td>CNAME</td>
						<td>TID</td>
						<td>CREDIT</td>
					</tr>
					<tr v-for="items in coursedata.data">
						<td>{{items.CID}}</td>
						<td>{{items.NAME}}</td>
						<td>{{items.TID}}</td>
						<td>{{items.CREDIT}}</td>
					</tr>
				</table>
			</span>
		</h4>
	</div>
</template>

<script>
import axios from '../axios/index.js'
export default {
	name: 'Course',
	props:{
		msg: String
	},
	components: {
	},
	data() {
		return {
			courseForm:{
				stid: ' '
			},
			loading: false,
			coursedata: {}
		}
	},
	mounted() {
	},
	methods: {
		login () {
			this.$router.replace('/Login')
		},
		Search: function() {
			this.$refs.courseForm.validate((valid) => {
				if(valid) {
					console.log(this.courseForm)
					this.$ajax.post('/home/OllSelect',this.courseForm)
					.then((res) => {
						if(res.data){
							console.log(res.data)
							this.coursedata = res.data
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
				} else {
					return false
				}
			})
		}
	},
	computed: {
		loginForm () {
				  console.log(this.$store.state)
			return this.$store.state.loginForm
		}
	}
}
</script>

<style>
</style>
