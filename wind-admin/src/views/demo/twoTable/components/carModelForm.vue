<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="80px" style="width: 400px; margin-left:50px;">
      <el-form-item label="汽车型号" prop="label">
        <el-input v-model="temp.name" />
      </el-form-item>
      <el-form-item label="型号值" prop="value">
        <el-input v-model="temp.value" />
      </el-form-item>
      <el-form-item label="排序" prop="sort">
        <el-input v-model="temp.sort" />
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
import { createCarModel, updateCarModel, getCarModel } from '@/api/demo/carModel'

export default {
  name: 'CarModelForm',
  data() {
    return {
      car: {},
      temp: {
        id: undefined,
        name: '',
        value: '',
        sort: 1,
        remarks: '',
        catId: undefined
      },
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        update: '编辑汽车型号',
        create: '添加汽车型号'
      },
      rules: {
        name: [{ required: true, message: '汽车型号标签不能为空', trigger: 'change' }],
        value: [{ required: true, message: '汽车型号值不能为空', trigger: 'change' }],
        sort: [{ required: true, message: '排序不能为空', trigger: 'change' }]
      }
    }
  },
  methods: {
    getList() {
      this.$emit('getList')
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: '',
        value: '',
        sort: 1,
        remarks: '',
        carId: this.car.id
      }
    },
    handleCreate(data) {
      this.car = data
      if (this.car.id === undefined || this.car.id === '') {
        this.$message.success('请选择汽车型号分组')
      } else {
        this.resetTemp()
        this.dialogStatus = 'create'
        this.dialogFormVisible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].clearValidate()
        })
      }
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          createCarModel(this.temp).then((response) => {
            const data = response.data
            if (data.code === 0) {
              this.dialogFormVisible = false
              this.$message.success('创建成功')
              this.getList()
            } else {
              this.$message.error(data.msg)
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
      getCarModel(id).then(response => {
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
          updateCarModel(tempData).then((response) => {
            const data = response.data
            if (data.code === 0) {
              this.dialogFormVisible = false
              this.$message.success('更新成功')
              this.getList()
            } else {
              this.$message.error(data.msg)
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
