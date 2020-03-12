

import Login from './views/user/Login.vue'
import Join from './views/user/Join.vue'
import Components from './views/Components.vue'

export default [


    {
        path : '/',
        name : 'Login',
        component : Login
    },
    {
        path : '/user/join',
        name : 'Join',
        component : Join
    },
    {
        path : '/components',
        name : 'Components',
        component : Components
    }
]
