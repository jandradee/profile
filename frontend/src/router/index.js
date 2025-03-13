import Vue from 'vue'
import Router from 'vue-router'
import profileUser from '@/components/profileUser'


Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'profileUser',
            component: profileUser
        }
    ],
    mode: 'history'
})