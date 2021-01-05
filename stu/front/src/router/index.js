import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import About from '../views/About.vue'
import Login from '../views/Login.vue'

Vue.use(VueRouter)



const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
	path: '/Login',
	name: 'Login',
	component: Login
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: About,
	mata: {
		requireAuth: true,
	},
	children: [
		{
			path: '/student',
			name: 'Student',
			component: () => import('@/components/Student.vue')
		},
		{
			path: '/course',
			name: 'Course',
			component: () => import('@/components/Course.vue')
		},
		{
			path: '/cv',
			name: 'CV',
			component: () => import('@/components/CV.vue')
		}
	]
  }
]

const router = new VueRouter({
  routes
})

export default router
