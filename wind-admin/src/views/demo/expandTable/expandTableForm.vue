<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" :close-on-click-modal="false">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="70px" style="width: 80%; margin-left:50px;">
      <el-form-item label="商品名称" prop="name">
        <el-input v-model="temp.name" />
      </el-form-item>
      <el-form-item label="所属店铺" prop="shop">
        <el-input v-model="temp.shop" />
      </el-form-item>
      <el-form-item label="商品分类" prop="category">
        <el-input v-model="temp.category" />
      </el-form-item>
      <el-form-item label="店铺地址" prop="address">
        <el-input v-model="temp.address" />
      </el-form-item>
      <el-form-item label="商品描述" prop="description">
        <el-input v-model="temp.description" />
      </el-form-item>
      <el-form-item label="标签" prop="tag">
        <el-input v-model="temp.tag" />
      </el-form-item>
      <el-form-item label="图片" prop="image">
        <el-input v-model="temp.image" />
        <el-upload
          ref="uploader"
          class="avatar-uploader"
          :action="uploadUrl"
          accept="image/jpeg,image/png,image/jpg"
          :show-file-list="false"
          :on-success="handleUploadSuccess"
          :before-upload="beforeUpload">
          <img v-if="temp.image" :src="temp.image" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon" />
        </el-upload>
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
import { createExpandTable, updateExpandTable, getExpandTable } from '@/api/demo/expandTable/expandTable'

export default {
  name: 'ExpandTableForm',
  data() {
    return {
      rules: {
      },
      temp: {
        id: undefined,
        name: undefined,
        shop: undefined,
        category: undefined,
        address: undefined,
        description: undefined,
        tag: undefined,
        image: undefined,
        createDate: undefined,
        updateBy: undefined,
        updateDate: undefined,
        remarks: undefined,
        delFlag: undefined,
        createBy: undefined,
        remark: ''
      },
      uploadUrl: 'http://' + process.env.VUE_APP_BASE_API + '/oss/attachment/upload?dir=test',
      textMap: {
        update: '编辑',
        create: '新建'
      },
      dialogFormVisible: false,
      dialogStatus: ''
    }
  },
  methods: {
    handleUploadSuccess(res, file) {
      console.log(res)
      if (res.code === 0) {
        this.temp.image = res.data
      } else {
        this.$message.error(res.msg)
      }
    },
    beforeUpload(file) {
      this.$refs.uploader.action = this.uploadUrl
      const isLt2M = file.size / 1024 < 300
      if (!isLt2M) {
        this.$message.error('上传图片大小不能超过 300KB!')
      }
      return isLt2M
    },
    getList() {
      this.$emit('refreshList')
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: undefined,
        shop: undefined,
        category: undefined,
        address: undefined,
        description: undefined,
        tag: undefined,
        image: undefined,
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
          createExpandTable(this.temp).then(response => {
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
      getExpandTable(id).then(response => {
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
          updateExpandTable(tempData).then(response => {
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
