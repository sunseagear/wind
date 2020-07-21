<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" :close-on-click-modal="false">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="120px" style="width: 80%; margin-left:50px;">
      <el-form-item label="租户名称" prop="name">
        <el-input v-model="temp.name" />
      </el-form-item>
      <el-form-item label="联系人" prop="contact">
        <el-input v-model="temp.contact" />
      </el-form-item>
      <el-form-item label="电话" prop="phone">
        <el-input v-model="temp.phone" />
      </el-form-item>
      <el-form-item label="用户名" prop="userName">
        <el-input v-if="dialogStatus==='create'" v-model="temp.userName" />
        <span v-else> {{ temp.userName }}</span>
      </el-form-item>
      <el-form-item label="备注" prop="remarks">
        <el-input v-model="temp.remarks" type="textarea" />
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="dialogFormVisible = false">
        {{ $t('table.cancel') }}
      </el-button>
      <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">
        {{ $t('table.confirm') }}
      </el-button>
    </div>
  </el-dialog>
</template>

<script>
import { createTenant, updateTenant, getTenant } from '@/api/sys/tenant/tenant'
import { validatePhoneRule } from '@/utils/validate'

export default {
  name: 'TenantForm',
  data() {
    return {
      rules: {
        contact: [{ required: true, message: '联系人为必填项', trigger: 'blur' }],
        phone: [{ required: true, message: '电话为必填项', trigger: 'blur' }, { validator: validatePhoneRule, tigger: 'blur' }],
        name: [{ required: true, message: '租户名称为必填项', trigger: 'blur' }],
        userName: [{ required: true, message: '用户名为必填项', trigger: 'blur' }]
      },
      temp: {
        id: undefined,
        createBy: undefined,
        createDate: undefined,
        updateBy: undefined,
        updateDate: undefined,
        delFlag: undefined,
        remarks: undefined,
        tenantId: undefined,
        contact: undefined,
        phone: undefined,
        name: undefined,
        userName: undefined,
        remark: ''
      },
      textMap: {
        update: '编辑',
        create: '新建'
      },
      dialogFormVisible: false,
      dialogStatus: ''
    }
  },
  methods: {
    getList() {
      this.$emit('refreshList')
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        createBy: undefined,
        createDate: undefined,
        updateBy: undefined,
        updateDate: undefined,
        delFlag: undefined,
        remarks: undefined,
        tenantId: undefined,
        contact: undefined,
        phone: undefined,
        name: undefined,
        userName: undefined,
        remark: ''
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
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          createTenant(this.temp).then(response => {
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
      this.resetTemp()
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
      getTenant(id).then(response => {
        if (response.data.code === 0) {
          this.temp = response.data.data
        } else {
          this.dialogFormVisible = false
          this.$message.error(response.data.msg)
        }
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.temp)
          updateTenant(tempData).then(response => {
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
