<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" :close-on-click-modal="false">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="80px" style="width: 80%; margin-left:50px;">
      <el-row :gutter="40">
        <el-col :span="12">
          <el-form-item label="姓名" prop="realname">
            <el-input v-model="temp.realname" />
          </el-form-item>
          <el-form-item label="用户名" prop="username">
            <el-input v-model="temp.username" />
          </el-form-item>
          <el-form-item label="上级部门" prop="organizationId">
            <system-organization v-model="temp.organizationId" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="头像" prop="portrait">
            <upload-image v-model="temp.portrait" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="temp.email" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="手机号码" prop="phone">
            <el-input v-model="temp.phone" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item v-if="temp.id===undefined" label="初始密码" prop="password">
            <el-input v-model="temp.password" type="password" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="可否登录" prop="status">
            <el-radio
              v-for="item in dictList('sf')"
              :key="'type' + item.label"
              v-model="temp.status"
              :label="item.value"
            >
              {{ item.label }}
            </el-radio>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="dialogFormVisible = false">{{ $t('table.cancel') }}</el-button>
      <el-button v-if="dialogStatus==='create'" type="primary" @click="createData">{{ $t('table.confirm') }}</el-button>
      <el-button v-else type="primary" @click="updateData">{{ $t('table.confirm') }}</el-button>
    </div>
  </el-dialog>
</template>

<script>
import { createUser, updateUser } from '@/api/sys/user'
import { fetchOrganizationList } from '@/api/sys/organization'
import SystemOrganization from '@/components/System/systemOrganization'
import { fetchUser } from '@/api/sys/user'
import UploadImage from '@/components/Upload/uploadImage'

export default {
  name: 'UserForm',
  components: { UploadImage, SystemOrganization },
  data() {
    return {
      treeList: [],
      treeProps: {
        value: 'id',
        label: 'name'
      },
      organizationIds: undefined,
      temp: {},
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        update: '编辑用户',
        create: '创建用户'
      },
      rules: {
        realname: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
        username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
        phone: [{ required: true, message: '请输入手机号码', trigger: 'blur' }],
        password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
        organizationId: [{ required: true, message: '请选择部门', trigger: 'blur' }]
      }
    }
  },
  created() {
    this.getTreeList()
  },
  methods: {
    getList() {
      this.$emit('refreshList')
    },
    getTreeList() {
      this.listLoading = true
      fetchOrganizationList(this.listQuery).then(response => {
        this.treeList = response.data.data
        this.listLoading = false
      })
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        realname: undefined,
        portrait: undefined,
        phone: undefined,
        job: undefined,
        username: undefined,
        password: undefined,
        organizationId: undefined,
        organization: {
          id: undefined
        }
      }
    },
    handleCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      if (this.temp.username.length < 4) {
        this.$message.error('用户名长度不能小于4')
        return
      }
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          createUser(this.temp).then(response => {
            if (response.data.code === 0) {
              this.getList()
              this.dialogFormVisible = false
              this.$message.success(response.data.msg)
            } else {
              this.$message.error(response.data.msg)
            }
          })
        }
      })
    },
    handleUpdate(id) {
      this.resetTemp() // copy obj
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
      fetchUser(id).then(response => {
        if (response.data.code === 0) {
          this.temp = response.data.data
        }
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.temp)
          updateUser(tempData).then(response => {
            if (response.data.code === 0) {
              this.dialogFormVisible = false
              this.getList()
              this.$message.success(response.data.msg)
            } else {
              this.$message.error(response.data.msg)
            }
          })
        }
      })
    }
  }
}
</script>

<style scoped>

</style>
