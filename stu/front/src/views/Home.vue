<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
<!--    <HelloWorld msg="Welcome to Your Vue.js App"/> -->
<!-- 	<Login msg="Welcome to Login!"/> -->
	<span v-if="loginForm">
		<h1>Hello! {{loginForm.name}}</h1>
		<el-button type="warning" @click="logout">注销</el-button>
	</span>
	<el-button v-else type="success" @click="login" style="display: block;margin: 0 auto;">点击登录</el-button>
  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'
// import Login from '@/components/Login.vue'

export default {
  name: 'Home',
  components: {
    // HelloWorld,
	// Login
  },
  methods: {
      login () {
          this.$router.replace('/Login')
      },
      logout () {
          this.$store.dispatch('logout').then(() => {
              this.$router.replace('/')
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
