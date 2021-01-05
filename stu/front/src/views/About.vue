<template>
  <div class="about">
    <h1>Welcome to SIS!</h1>
	<div class="nav">
		<router-link to="/student">student</router-link> |
		<router-link to="/course">course</router-link> |
		<router-link to="/cv">cv</router-link>
	</div>
	<router-view></router-view>
  </div>
</template>

<script>
import router from '../router/index.js'
import student from '@/components/Student.vue'
import course from '@/components/Course.vue'
import cv from '@/components/CV.vue'
import store from '../store/index.js'

export default {
  name: 'About',
  components: {
  },
}
</script>

<style lang="less">
.about {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

.nav {
  padding: 10px;

  a {
    font-weight: bold;
    color: #2c3e50;
	text-decoration: none;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>