<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" :close-on-click-modal="false">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="70px" style="width: 80%; margin-left:50px;">
      <el-form-item label="区域" prop="areaId">
        <el-cascader
          v-model="temp.areaId"
          :options="treeList"
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
      <el-form-item label="类型" prop="type">
        <el-input v-model="temp.type" />
      </el-form-item>
      <el-form-item label="标签" prop="tag">
        <el-input v-model="temp.tag" />
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
import { createTreeAndTable, updateTreeAndTable, getTreeAndTable } from '@/api/demo/treeandtable/treeAndTable'

export default {
  name: 'TreeAndTableForm',
  data() {
    return {
      rules: {
      },
      temp: {
        id: undefined,
        name: undefined,
        type: undefined,
        tag: undefined,
        areaId: undefined,
        createDate: undefined,
        updateBy: undefined,
        updateDate: undefined,
        remarks: undefined,
        delFlag: undefined,
        createBy: undefined,
        remark: ''
      },
      treeList: [],
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
    setList(treeList) {
      this.treeList = treeList
    },
    getList() {
      this.$emit('refreshList')
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: undefined,
        type: undefined,
        tag: undefined,
        areaId: undefined,
        createDate: undefined,
        updateBy: undefined,
        updateDate: undefined,
        remarks: undefined,
        delFlag: undefined,
        createBy: undefined,
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
          createTreeAndTable(this.temp).then(response => {
            if (response.data.code === 0) {
              this.getList()
              this.dialogFormVisible = false
              this.$message.success('创建成功')
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
      getTreeAndTable(id).then(response => {
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
          updateTreeAndTable(tempData).then(response => {
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
