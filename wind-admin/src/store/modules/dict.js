import { fetchDicts } from '@/api/sys/dict'

const state = {
  dicts: [],
  pageArray: [20, 50, 100],
  defaultPageSize: 25
}

const mutations = {
  SET_DICTS: (state, dicts) => {
    state.dicts = dicts
  },
  SET_PAGEARRAY: (state, pageArray) => {
    state.pageArray = pageArray
    state.defaultPageSize = pageArray[0]
  }
}
const actions = {
  // 获取数据字典
  GetDicts({ commit, state }) {
    return new Promise((resolve, reject) => {
      fetchDicts().then(response => {
        const data = response.data.data
        const value = []
        data['page'].forEach((row) => {
          value.push(Number.parseInt(row.value))
        })
        commit('SET_DICTS', data)
        commit('SET_PAGEARRAY', value)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
