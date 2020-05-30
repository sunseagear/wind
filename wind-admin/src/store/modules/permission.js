import { asyncRoutes, constantRoutes, constantMenus } from '@/router'
import { getMenus, fetchPermissionList } from '@/api/sys/menu'

const _import = require('@/router/_import_vue')
import Layout from '@/layout'

export function filterAsyncRoutes(routes) {
  var res = []
  routes.forEach(route => {
    const tmp = { ...route }
    if (tmp.children) {
      res = res.concat(filterAsyncRoutes(tmp.children))
    } else {
      const item = {
        path: tmp.path,
        component: Layout,
        // meta: { title: tmp.meta.title, affix: tmp.meta.affix },
        children: [
          {
            path: '/',
            name: tmp.path,
            meta: { title: tmp.meta.title, affix: tmp.meta.affix }
          }
        ]
      }

      const component = tmp.component
      try {
        // tmp.name = tmp.path
        if (component) {
          item.children[0].component = _import(component)
        } else {
          item.children[0].component = undefined
        }
      } catch (e) {
        item.children[0].component = () => import('@/views/errorPage/404')
      }
      res.push(item)
    }
  })
  return res
}

export function filterAsyncMenus(routes) {
  const res = []

  routes.forEach(route => {
    const tmp = { ...route }

    if (tmp.children) {
      tmp.children = filterAsyncMenus(tmp.children)
    }
    res.push(tmp)
  })
  return res
}

const state = {
  routes: [],
  menus: [],
  addRoutes: [],
  fetchRoutes: [],
  permissions: []
}

const mutations = {
  SET_ROUTES: (state, routes) => {
    state.addRoutes = routes
    state.routes = constantRoutes.concat(routes)
  },
  SET_PERMISSIONS: (state, permissions) => {
    state.permissions = permissions
  },
  SET_FETCHROUTES: (state, routers) => {
    state.fetchRoutes = routers
  },
  SET_MENUS: (state, menus) => {
    state.menus = constantMenus.concat(menus)
  }
}

const actions = {
  generateRoutes({ commit }, roles) {
    return new Promise(resolve => {
      let accessedRoutes
      if (roles.includes('admin')) {
        accessedRoutes = asyncRoutes || []
      } else {
        accessedRoutes = filterAsyncRoutes(asyncRoutes, roles)
      }
      commit('SET_ROUTES', accessedRoutes)
      resolve(accessedRoutes)
    })
  },
  // 获取未认证路由
  GetRoutes({ commit, state }) {
    return new Promise((resolve, reject) => {
      getMenus(state.token).then(response => {
        if (state.fetchRoutes.length === 0) {
          // console.log('response.data.data', response.data.data)
          commit('SET_FETCHROUTES', response.data.data)
          const accessedRouters = filterAsyncRoutes(response.data.data)
          // console.log('accessedRouters', accessedRouters)
          commit('SET_ROUTES', accessedRouters)
          const accessedMenus = response.data.data
          // console.log('accessedMenus', accessedMenus)
          commit('SET_MENUS', accessedMenus)
        }
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },
  // 获取权限
  GetPermissions({ commit, state }) {
    return new Promise((resolve, reject) => {
      fetchPermissionList(state.token).then(response => {
        const permissions = response.data.data
        commit('SET_PERMISSIONS', permissions)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },
  ResetPermissionsAndRoute({ commit }) {
    console.log('ResetPermissions')
    return new Promise((resolve, reject) => {
      commit('SET_PERMISSIONS', [])
      commit('SET_ROUTES', [])
      commit('SET_FETCHROUTES', [])
      commit('SET_MENUS', [])
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
