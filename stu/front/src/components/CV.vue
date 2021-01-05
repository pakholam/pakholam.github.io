<template>
	<div class="cv">
		<h4>
			<span v-if="loginForm">
				<el-form ref="cvForm" :model="cvForm" class="cvForm" autocomplete="on" label-width="100px">
					<el-form-item label="学生号" prop="stid">
							<el-input ref="stid" v-model="cvForm.stid" placeholder="请输入学生号" name="stid" type="text" tabindex="1" autocomplete="off"/>
						</el-form-item>
						<el-form-item label="课程号" prop="cid">
							<el-input  ref="cid" v-model="cvForm.cid" placeholder="请输入课程号" name="cid" type="text" tabindex="2" autocomplete="on" />
						</el-form-item>
					<el-form-item>
						<el-button :loading="loading" type="primary" @click.native.prevent="addSelect">添加</el-button>
						<el-button :loading="loading" type="primary" @click.native.prevent="delSelect">删除</el-button>					
					</el-form-item>
				</el-form>
			</span>
			<span v-else>
				<el-button  type="success" @click="login" style="display: block;margin: 0 auto;">登录后查看信息</el-button>
			</span>
		</h4>
	</div>
</template>

<script>
	export default {
		name: 'Course',
		components: {
		},
		data(){
			return{
				cvForm:{
					stid: '',
					cid: ''
				},
				loading: false
			}
		},
		mounted(){
			
		},
		methods: {
			login () {
				this.$router.replace('/Login')
			},
			addSelect(){
				this.$refs.cvForm.validate((valid) => {
					if (valid) {
						console.log(this.cvForm)
						this.$ajax.post('/home/addSelect',this.cvForm)
						.then((res) => {
							if (res.data.code == 200) {
								console.log(res.data.re)
								this.$notify({
									type: 'success',
									message: '选课成功',
									duration: 3000
								})
								this.$router.replace('/')
							} else if (res.data.code== 400){
								console.log(res.data.re)
								this.$message({
									type: 'error',
									message: '已选该课程',
									showClose: true
								})
							} else if (res.data.code== 401){
								console.log(res.data.re)
								this.$message({
									type: 'error',
									message: '分数已满19',
									showClose: true
								})
							} else if (res.data.code== 402){
								console.log(res.data.re)
								this.$message({
									type: 'error',
									message: '分数够了',
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
			delSelect(){
				this.$refs.cvForm.validate((valid) => {
					if (valid) {
						console.log(this.cvForm)
						this.$ajax.post('/home/delSelect',this.cvForm)
						.then((res) => {
							if (res.data.code == 200) {
								this.$notify({
									type: 'success',
									message: '退课成功',
									duration: 3000
								})
								this.$router.replace('/')
							} else if (res.data.code == 400){
								this.$message({
									type: 'error',
									message: '退课失败！学生号或课程号错误',
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
			}
		},
		computed:{
			loginForm () {
				console.log(this.$store.state)
				return this.$store.state.loginForm
			}
		}
	}
</script>

<style>
</style>

<!-- del: function(e, value) {
			this.$ajax.post('/home/delSelect',{"stid":this.loginForm.stid,"cid":value})
			.then((res) => {
				if(res.data.code==200){
					console.log(res.data)
					this.$message({
						type: 'alert',
						message: '退选成功',
						showClose: true
					})
				}else if(res.data.code==400){
					this.$message({
						type: 'error',
						message: '退选失败',
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
		} -->