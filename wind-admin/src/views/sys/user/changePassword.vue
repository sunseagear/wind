<template>
  <div class="app-container calendar-list-container">
    <el-form ref="userForm" :model="userForm" :rules="rules" label-width="100px" class="demo-userForm">
      <el-form-item label="原密码" prop="oldPassword">
        <el-input v-model.trim="userForm.oldPassword" :type="passwordType" placeholder="原密码" />
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model.trim="userForm.password" :type="passwordType" placeholder="密码" />
      </el-form-item>
      <el-form-item label="确认密码" prop="passwordConfirm">
        <el-input v-model.trim="userForm.passwordConfirm" :type="passwordType" placeholder="确认密码" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('userForm')">保存</el-button>
        <el-button @click="resetForm('userForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import { myUpdateChangePassword } from '@/api/sys/user'

export default {
  data() {
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.userForm.password) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      userForm: {
        password: '',
        oldPassword: '',
        passwordConfirm: ''
      },
      passwordType: 'password',
      rules: {
        passwordConfirm: [{ required: true, validator: validatePass, trigger: 'blur' }],
        password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
        oldPassword: [{ required: true, message: '请输入原密码', trigger: 'blur' }]
      }
    }
  },
  created() {
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          myUpdateChangePassword(this.userForm).then(response => {
            if (response.data.code === 0) {
              this.$message.success(response.data.msg)
              this.$store.dispatch('user/logout').then(() => {
                location.reload()// In order to re-instantiate the vue-router object to avoid bugs
              })
            } else {
              this.$message.error(response.data.msg)
            }
          })
        } else {
          return false
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields()
    }
  }
}
</script>
