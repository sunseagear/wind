import router from './router'
import store from './store'
import { Message } from 'element-ui'
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css' // progress bar style
import { getToken } from '@/utils/auth' // get token from cookie
import getPageTitle from '@/utils/get-page-title'

NProgress.configure({ showSpinner: false }) // NProgress Configuration

const whiteList = ['/login', '/auth-redirect'] // no redirect whitelist

router.beforeEach(async(to, from, next) => {
  // start progress bar
  NProgress.start()

  // set page title
  document.title = getPageTitle(to.meta.title)

  // determine whether the user has logged in
  const hasToken = getToken()

  if (hasToken) {
    if (to.path === '/login') {
      // if is logged in, redirect to the home page
      // next({ path: '/' })
      NProgress.done()
    } else {
      if (store.getters.permissions.length === 0) { // 判断当前用户是否已拉取完user_info信息
        store.dispatch('user/getInfo').then(res => { // 拉取user_info
          // next('/dashboard')
          // 加载数据字典
          store.dispatch('dict/GetDicts')
          // 获取路由
          if (store.getters.fetchRoutes.length === 0) { // 判断是否获取路由
            store.dispatch('permission/GetRoutes').then(() => {
              // console.log(store.getters.addRoutes)
              router.addRoutes(store.getters.addRoutes) // 动态添加可访问路由表
              next({ ...to, replace: true, path: '/dashboard' })
            })
          }
          // 获取权限
          store.dispatch('permission/GetPermissions').then(() => { // 获取权限
            // 没有动态改变权限的需求可直接next() 删除下方权限判断 ↓
            // next()
            next('/dashboard')
          })
        }).catch(() => {
          store.dispatch('user/logout').then(() => {
            Message.error('你的账号权限存在问题')
            next('/login') // 否则全部重定向到登录页
          })
        })
      } else {
        // 没有动态改变权限的需求可直接next() 删除下方权限判断 ↓
        next()
        /* if (hasPermission(store.getters.permissions, to.meta.permission)) {
          next()//
        } else {
          next({ path: '/401', replace: true, query: { noGoBack: true }})
        } */
        // 可删 ↑
      }
    }
  } else {
    /* has no token*/

    if (whiteList.indexOf(to.path) !== -1) {
      // in the free login whitelist, go directly
      next()
    } else {
      // other pages that do not have permission to access are redirected to the login page.
      next(`/login`)
      NProgress.done()
    }
  }
})

router.afterEach(() => {
  // finish progress bar
  NProgress.done()
})
