import { refreshToken } from '@/api/sys/oauth2'
import { getToken, setToken, getRefreshToken } from '@/utils/auth'
import { Message, MessageBox } from 'element-ui'
import store from '@/store'
import axios from 'axios'
import qs from 'qs'

// 转换请求方式
axios.defaults.transformRequest = [function(data) {
  return qs.stringify(data, { allowDots: true })
}]
// create an axios instance
const service = axios.create({
  baseURL: 'http://' + process.env.VUE_APP_BASE_API, // url = base url + request url
  // withCredentials: true, // send cookies when cross-domain requests
  timeout: 60000 // request timeout
})

// request interceptor
service.interceptors.request.use(
  config => {
    // Do something before request is sent
    if (store.getters.token) {
      // 让每个请求携带token-- ['X-Token']为自定义key 请根据实际情况自行修改
      config.headers['access_token'] = getToken()
    }
    return config
  },
  error => {
    // Do something with request error
    console.log(error) // for debug
    Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  // response => response,
  /**
   * 下面的注释为通过在response里，自定义code来标示请求状态
   * 当code返回如下情况则说明权限有问题，登出并返回到登录页
   * 如想通过 xmlhttprequest 来状态码标识 逻辑可写在下面error中
   * 以下代码均为样例，请结合自生需求加以修改，若不需要，则可删除
   */
  async response => {
    const res = response.data
    if (res.code != null && res.code !== 0) {
      // 200004:Token 过期了;
      if (res.code === 200004) {
        const refreshTokenData = getRefreshToken()
        const tokenResponse = await refreshToken(refreshTokenData)
        const data = tokenResponse.data
        store.commit('user/SET_TOKEN', data.access_token)
        setToken(tokenResponse.data.access_token)
        var originalRequest = response.config
        originalRequest._retry = true
        // Do something before request is sent
        if (store.getters.token) {
          // 让每个请求携带token-- ['X-Token']为自定义key 请根据实际情况自行修改
          originalRequest.headers['access_token'] = getToken()
        }
        return axios.request(originalRequest)
      } else if (res.code === 100008 || res.code === 100009) {
        // 请自行在引入 MessageBox
        MessageBox.confirm('你已被登出，可以取消继续留在该页面，或者重新登录', '确定登出', {
          confirmButtonText: '重新登录',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          store.dispatch('user/logout').then(() => {
            location.reload() // 为了重新实例化vue-router对象 避免bug
          })
        })
      }
    }
    return Promise.resolve(response)
  },
  error => {
    Message({
      message: error.data.msg,
      type: 'error',
      duration: 5 * 1000
    })
    return Promise.reject(error)
  }
)

export default service
