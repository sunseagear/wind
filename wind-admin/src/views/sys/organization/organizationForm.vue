<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="100px" style="margin-left:50px;margin-right:50px;">
      <el-form-item label="上级部门" prop="parentIds">
        <el-cascader
          v-model="temp.parentIds"
          :options="list"
          :props="treeProps"
          :show-all-levels="false"
          label="name"
          change-on-select
          clearable
        />
      </el-form-item>
      <el-form-item label="部门名称" prop="name">
        <el-input v-model="temp.name" />
      </el-form-item>
      <el-form-item label="备注">
        <el-input v-model="temp.remarks" :autosize="{ minRows: 2, maxRows: 4}" type="textarea" placeholder="Please input" />
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="dialogFormVisible = false">{{ $t('table.cancel') }}</el-button>
      <el-button v-if="dialogStatus=='create'" type="primary" @click="createData">{{ $t('table.confirm') }}</el-button>
      <el-button v-else type="primary" @click="updateData">{{ $t('table.confirm') }}</el-button>
    </div>
  </el-dialog>
</template>

<script>
import { createOrganization, updateOrganization } from '@/api/sys/organization'

export default {
  name: 'OrganizationForm',
  data() {
    return {
      rules: {
        name: [{ required: true, message: '名称为必填项', trigger: 'blur' }]
      },
      list: [],
      temp: {},
      textMap: {
        update: '编辑',
        create: '新建'
      },
      treeProps: {
        value: 'id',
        label: 'name'
      },
      dialogFormVisible: false,
      dialogStatus: ''
    }
  },
  methods: {
    getList() {
      this.$emit('refreshList')
    },
    setList(list) {
      this.list = list
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: undefined,
        parentIds: undefined,
        remark: undefined
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
      // 预处理提交的数据
      const parentIds = this.temp.parentIds
      if (parentIds !== undefined && parentIds !== '') {
        if (parentIds instanceof Array && parentIds.length > 0) {
          const parentId = parentIds[parentIds.length - 1]
          this.temp.parentId = parentId
        }
      }
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if (this.temp.parentIds !== undefined && this.temp.parentIds !== '') {
            this.temp.parentIds.length = 0
          }
          createOrganization(this.temp).then(() => {
            this.getList()
            this.dialogFormVisible = false
            this.$message.success('创建成功')
          })
        }
      })
    },
    handleUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      if (this.temp.children !== undefined) {
        this.temp.children.length = 0
      }
      if (this.temp.parentIds !== undefined) {
        let parentIds = this.temp.parentIds.trim()
        if (parentIds.length > 0) {
          parentIds = parentIds.substr(0, parentIds.length - 1)
        }
        this.temp.parentIds = parentIds.split('\/')
      }
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const parentIds = this.temp.parentIds
          if (parentIds !== undefined && parentIds !== '') {
            if (parentIds instanceof Array && parentIds.length > 0) {
              const parentId = parentIds[parentIds.length - 1]
              this.temp.parentId = parentId
            }
          }
          if (this.temp.parentIds !== undefined && this.temp.parentIds !== '') {
            this.temp.parentIds = undefined
          }
          if (this.temp.parent !== undefined) {
            this.temp.parent = undefined
          }
          const tempData = Object.assign({}, this.temp)
          console.log(tempData)
          updateOrganization(tempData).then(() => {
            this.getList()
            this.dialogFormVisible = false
            this.$message.success('更新成功')
          })
        }
      })
    }
  }
}
</script>
