<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="120px" style="width: 400px; margin-left:50px;">
      <el-form-item label="角色名称" prop="name">
        <el-input v-model="temp.name" />
      </el-form-item>
      <el-form-item label="角色编码" prop="code">
        <el-input v-model="temp.code" />
      </el-form-item>
      <el-form-item label="是否系统数据" prop="isSys">
        <el-radio
          v-for="item in dictList('sf')"
          :key="item.id"
          v-model="temp.isSys"
          :label="item.value"
        >
          {{ item.label }}
        </el-radio>
      </el-form-item>
      <el-form-item label="是否可用" prop="usable">
        <el-radio
          v-for="item in dictList('sf')"
          :key="item.id"
          v-model="temp.usable"
          :label="item.value"
        >
          {{ item.label }}
        </el-radio>
      </el-form-item>
      <el-form-item label="备注">
        <el-input
          v-model="temp.remarks"
          :autosize="{ minRows: 2, maxRows: 4}"
          type="textarea"
          placeholder="请输入内容"
        />
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
import { addRole, updateRole } from '@/api/sys/role'

export default {
  name: 'RoleForm',
  data() {
    return {
      temp: {},
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        update: '编辑角色',
        create: '添加角色'
      },
      rules: {
        code: [{ required: true, message: '角色编码必填', trigger: 'change' }],
        name: [{ required: true, message: '角色名称必填', trigger: 'change' }],
        isSys: [{ required: true, message: '是否系统必选', trigger: 'blur' }],
        usable: [{ required: true, message: '是否可用必选', trigger: 'blur' }]
      }

    }
  },
  methods: {
    getList() {
      this.$emit('refreshList')
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        isSys: '1',
        usable: '1',
        name: '',
        code: '',
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
          addRole(this.temp).then(() => {
            this.list.unshift(this.temp)
            this.dialogFormVisible = false
            this.$message.success('添加成功')
          })
        }
      })
    },
    handleUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.temp)
          updateRole(tempData).then(() => {
            for (const v of this.list) {
              if (v.id === this.temp.id) {
                const index = this.list.indexOf(v)
                this.list.splice(index, 1, this.temp)
                break
              }
            }
            this.dialogFormVisible = false
            this.$message.success('更新成功')
          })
        }
      })
    }
  }
}
</script>

<style scoped>

</style>
