import Vue from 'vue'

import Cookies from 'js-cookie'

import 'normalize.css/normalize.css' // a modern alternative to CSS resets

import Element from 'element-ui'
import moment from 'moment'
import './styles/element-variables.scss'
import '@fortawesome/fontawesome-free/css/all.min.css'
import '@/styles/index.scss' // global css

import App from './App'
import store from './store'
import router from './router'

import i18n from './lang' // internationalization
import './icons' // icon
import './permission' // permission control
import './utils/error-log' // error log
import formValidate from './utils/formValidate' // 表单验证
import { isNull } from './utils/index' // 判空

import * as filters from './filters' // global filters

import CustomComponents from '@/components/Icons/index.js'
import BaiduMap from 'vue-baidu-map'
// fontawesome图标
Object.keys(CustomComponents).forEach(key => Vue.use(CustomComponents[key]))

Vue.use(BaiduMap, {
  // ak 是在百度地图开发者平台申请的密钥 详见 http://lbsyun.baidu.com/apiconsole/key */
  ak: ''
})
Vue.use(Element, {
  size: Cookies.get('size') || 'medium', // set element-ui default size
  i18n: (key, value) => i18n.t(key, value)
})

// 时间转化
Vue.filter('dateformat', function(dataStr, pattern = 'YYYY-MM-DD HH:mm:ss') {
  return moment(dataStr).format(pattern)
})

// register global utility filters
Object.keys(filters).forEach(key => {
  Vue.filter(key, filters[key])
})
// 定义字典全局方法
Vue.prototype.dictList = function(code) {
  return store.getters.dicts[code]
}
Vue.prototype.formValidate = formValidate

Vue.config.productionTip = false
Vue.prototype.isNull = isNull

new Vue({
  el: '#app',
  router,
  store,
  i18n,
  render: h => h(App)
})
