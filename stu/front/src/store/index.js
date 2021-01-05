import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
	state: {
		loginForm: undefined,
	},
	mutations: {
		login(state, payload) {
			state.loginForm = payload
		},
		logout(state) {
			state.loginForm = undefined
		},
	},
	actions: {
		login(context, payload) {
			context.commit('login',payload)
		},
		logout(context) {
			context.commit('logout')
		},
	}
}) 

export default store
