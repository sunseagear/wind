<template>
  <div class="app-container calendar-list-container">
    <el-form ref="userForm" :model="userForm" :rules="rules" label-width="100px" class="demo-userForm">
      <el-form-item label="姓名" prop="realname">
        <el-input v-model="userForm.realname" />
      </el-form-item>
      <el-form-item label="用户名" prop="username">
        <el-input v-model="userForm.username" />
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="userForm.email" />
      </el-form-item>
      <el-form-item label="手机号码" prop="phone">
        <el-input v-model="userForm.phone" />
      </el-form-item>
      <el-form-item label="头像" prop="portrait">
        <upload-image v-model="userForm.portrait" dir="avatar" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('userForm')">保存</el-button>
        <el-button @click="resetForm('userForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import uploadImage from '@/components/Upload/uploadImage'
import { myUpdateUser, getInfo } from '@/api/sys/user'

export default {
  name: 'UserInfo',
  components: { uploadImage },
  data() {
    return {
      userForm: {
        realname: '',
        username: '',
        email: '',
        phone: '',
        password: '',
        portrait: ''
      },
      rules: {
        realname: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
        username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
        email: [{ required: true, message: '请输入邮箱', trigger: 'blur' }],
        phone: [{ required: true, message: '请输入手机号码', trigger: 'blur' }],
        password: [{ required: true, message: '请输入密码', trigger: 'blur' }]
      }
    }
  },
  created() {
    this.getUserInfo()
  },
  methods: {
    getUserInfo() {
      getInfo().then(response => {
        if (response.data.code === 0) {
          this.userForm = response.data.data
        } else {
          this.$message.error(response.data.msg)
        }
      })
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          myUpdateUser(this.userForm).then(response => {
            if (response.data.code === 0) {
              this.$message.success(response.data.msg)
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
