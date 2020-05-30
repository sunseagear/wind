<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" :close-on-click-modal="false">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="70px" style="width: 80%; margin-left:50px;">
      <el-form-item label="上级" prop="parentIds">
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
      <el-form-item label="机构名称" prop="name">
        <el-input v-model="temp.name" />
      </el-form-item>
      <el-form-item label="地理编码" prop="geocoding">
        <el-input v-model="temp.geocoding" />
      </el-form-item>
      <el-form-item label="邮政编码" prop="postalCode">
        <el-input v-model="temp.postalCode" />
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
import { createTreeTable, updateTreeTable, getTreeTable } from '@/api/demo/treeTable/treeTable'

export default {
  name: 'TreeTableForm',
  data() {
    return {
      rules: {
      },
      temp: {
        id: undefined,
        name: undefined,
        geocoding: undefined,
        postalCode: undefined,
        parentId: undefined,
        parentIds: undefined,
        createBy: undefined,
        createDate: undefined,
        updateBy: undefined,
        updateDate: undefined,
        delFlag: undefined,
        remarks: undefined,
        remark: ''
      },
      list: [],
      treeProps: {
        value: 'id',
        label: 'name',
        expandTrigger: 'hover'
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
    setList(list) {
      this.list = list
    },
    getList() {
      this.$emit('refreshList')
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: undefined,
        geocoding: undefined,
        postalCode: undefined,
        parentId: undefined,
        parentIds: undefined,
        createBy: undefined,
        createDate: undefined,
        updateBy: undefined,
        updateDate: undefined,
        delFlag: undefined,
        remarks: undefined,
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
          // 预处理提交的数据
          const parentIds = this.temp.parentIds
          if (parentIds !== undefined && parentIds !== '') {
            if (parentIds instanceof Array && parentIds.length > 0) {
              const parentId = parentIds[parentIds.length - 1]
              this.temp.parentId = parentId
            }
          }

          if (this.temp.parentIds !== undefined && this.temp.parentIds !== '') {
            this.temp.parentIds.length = 0
          }
          createTreeTable(this.temp).then(response => {
            if (response.data.code === 0) {
              this.getList()
              this.dialogFormVisible = false
              this.$message.success('创建成功')
            } else {
              this.dialogFormVisible = false
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
      getTreeTable(id).then(response => {
        if (response.data.code === 0) {
          this.temp = response.data.data
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
        } else {
          this.dialogFormVisible = false
          this.$message.error(response.data.msg)
        }
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
          updateTreeTable(tempData).then(() => {
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
