import validator from 'validator'
/* 表单校验规则方法命名以Rule为结尾，方便和一遍的校验区分*/

export default {
  validateNumberRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    if (!validator.isNumeric('' + value)) {
      callback(new Error('请输入数字'))
    } else {
      callback()
    }
  },
  validateNumberGTZRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    if (validator.isNumeric('' + value, [{ no_symbols: false }]) && value > 0) {
      callback()
    } else {
      callback(new Error('请输入正数'))
    }
  },
  validateIntegerRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    if (!validator.isInt('' + value)) {
      callback(new Error('请输入整数'))
    } else {
      callback()
    }
  },
  validateIngeterGTZRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    if (!validator.isInt('' + value, { gt: 0 })) {
      callback(new Error('请输入正整数'))
    } else {
      callback()
    }
  },
  validateAlphaRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    if (!validator.isAlpha(value, 'en-US')) {
      callback(new Error('请输入纯字母'))
    } else {
      callback()
    }
  },

  /*  是否身份证号码*/
  validateIdNoRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    const reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/
    if (value === '' || value === undefined || value === null) {
      callback()
    } else {
      if ((!reg.test(value)) && value !== '') {
        callback(new Error('请输入正确的身份证号码'))
      } else {
        callback()
      }
    }
  },
  /*  是否身份证号码,详细规则校验*/
  validateIdNoStrictRule(rule, code, callback) {
    if (code === undefined || code === null || code === '') {
      callback()
    }
    var city = { 11: '北京', 12: '天津', 13: '河北', 14: '山西', 15: '内蒙古', 21: '辽宁', 22: '吉林', 23: '黑龙江 ',
      31: '上海', 32: '江苏', 33: '浙江', 34: '安徽', 35: '福建', 36: '江西', 37: '山东', 41: '河南', 42: '湖北 ',
      43: '湖南', 44: '广东', 45: '广西', 46: '海南', 50: '重庆', 51: '四川', 52: '贵州', 53: '云南', 54: '西藏 ',
      61: '陕西', 62: '甘肃', 63: '青海', 64: '宁夏', 65: '新疆', 71: '台湾', 81: '香港', 82: '澳门', 91: '国外 ' }
    var tip = ''
    var pass = true

    if (!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)) {
      tip = '身份证号格式错误'
      pass = false
    } else if (!city[code.substr(0, 2)]) {
      tip = '地址编码错误'
      pass = false
    } else {
      // 18位身份证需要验证最后一位校验位
      if (code.length === 18) {
        code = code.split('')
        // ∑(ai×Wi)(mod 11)
        // 加权因子
        var factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]
        // 校验位
        var parity = [1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2]
        var sum = 0
        var ai = 0
        var wi = 0
        for (var i = 0; i < 17; i++) {
          ai = code[i]
          wi = factor[i]
          sum += ai * wi
        }
        if (parity[sum % 11] !== code[17]) {
          tip = '校验位错误'
          pass = false
        }
      }
    }
    if (!pass) {
      callback(new Error(tip))
    } else {
      callback()
    }
    // if (!pass) alert(tip)
    // return pass
  },

  validateURLRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    if (!validator.isURL(value)) {
      callback(new Error('请输入正确的网址'))
    } else {
      callback()
    }
  },
  /*  是否邮箱*/
  validateEMailRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    const reg = /^([a-zA-Z0-9]+[-_\.]?)+@[a-zA-Z0-9]+\.[a-z]+$/
    if (value === '' || value === undefined || value === null) {
      callback()
    } else {
      if (!reg.test(value)) {
        callback(new Error('请输入正确的邮箱地址'))
      } else {
        callback()
      }
    }
  },
  /*  是否手机号码*/
  validateMobileRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    const reg = /^[1][3,4,5,7,8,9][0-9]{9}$/
    if (value === '' || value === undefined || value === null) {
      callback()
    } else {
      if ((!reg.test(value)) && value !== '') {
        callback(new Error('请输入正确的电话号码'))
      } else {
        callback()
      }
    }
  },
  /*  是否手机号码或者固话*/
  validateTelOrMobileRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    const reg = /^((0\d{2,3}-\d{7,8})|(1[34578]\d{9}))$/
    if (value === '' || value === undefined || value === null) {
      callback()
    } else {
      if ((!reg.test(value)) && value !== '') {
        callback(new Error('请输入正确的电话号码或者固话号码'))
      } else {
        callback()
      }
    }
  },
  /*  是否固话*/
  validateTelphoneRule(rule, value, callback) {
    if (value === undefined || value === null || value === '') {
      callback()
    }
    const reg = /0\d{2}-\d{7,8}/
    if (value === '' || value === undefined || value === null) {
      callback()
    } else {
      if ((!reg.test(value)) && value !== '') {
        callback(new Error('请输入正确的固话（格式：区号+号码,如010-1234567）'))
      } else {
        callback()
      }
    }
  },

  /*  是否合法IP地址*/
  validateIPRule(rule, value, callback) {
    if (value === '' || value === undefined || value === null) {
      callback()
    } else {
      const reg = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
      if ((!reg.test(value)) && value !== '') {
        callback(new Error('请输入正确的IP地址'))
      } else {
        callback()
      }
    }
  }
}

