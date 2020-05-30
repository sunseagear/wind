<template>
  <div class="upload-container">
    <el-upload
      v-loading="uploadLoading"
      :data="uploadData"
      :action="uploadImageUrl"
      :show-file-list="false"
      :on-success="handleSuccess"
      :on-error="handleError"
      :before-upload="beforeUpload"
      class="uploader"
    >
      <img v-if="imageUrl" :src="imageUrl" class="avatar">
      <i v-else class="el-icon-upload uploader-icon">
        {{ uploadLabel }}
      </i>
      <div v-if="!imageUrl&&showWaringLabel" slot="tip" class="waring-label">似的发射点发{{ waringLabel }}</div>
    </el-upload>
  </div>
</template>

<script>
import defaultImg from '@/assets/img/default_img.jpg' // 水波纹指令
export default {
  name: 'UploadImage',
  props: {
    value: {
      type: String,
      default: ''
    },
    dir: {
      type: String,
      default: ''
    },
    extension: {
      type: String,
      default: ''
    },
    uploadLabel: {
      type: String,
      default: '上传文件'
    },
    limit: {
      type: Number,
      required: false,
      default: 2
    },
    basePath: {
      type: String,
      default: ''
    },
    showWaringLabel: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      uploadImageUrl: 'http://' + process.env.VUE_APP_BASE_API + '/json/oss/upload',
      uploadData: { 'base_path': this.basePath },
      imageExtension: ['bmp', 'jpg', 'jpeg', 'png', 'gif'],
      extensions: [],
      uploadLoading: false,
      resultUrl: undefined,
      waringLabel: '只能上传' + this.extension + '文件，且不超过' + this.limit + 'M'
    }
  },
  computed: {
    imageUrl() {
      if (this.resultUrl) {
        const fileExtension = this.getFileExtension(this.resultUrl)
        if (fileExtension !== '' && this.imageExtension.includes(fileExtension)) {
          return this.resultUrl
        }
        return defaultImg
      }
      return ''
    }
  },
  watch: {
    value: {
      immediate: true,
      handler(val) {
        this.resultUrl = val
      }
    }
  },
  created() {
    this.extension = this.extension.replace(/(^\s+)|(\s+$)/g, '')
    this.extension = this.extension.replace(/\s/g, '')
    this.extensions = this.extension.split(',')
    if (this.dir !== '') {
      this.uploadImageUrl += '?dir=' + this.dir
    }
  },
  methods: {
    emitInput(val) {
      this.$emit('input', val)
    },
    handleSuccess(response, file) {
      this.uploadLoading = false
      this.resultUrl = response.data
      this.emitInput(this.resultUrl)
    },
    handleError(response) {
      console.log(response)
      this.uploadLoading = false
      if (response.msg) {
        this.$message.error(response.msg)
      } else {
        this.$message.error('上传失败')
      }
    },
    beforeUpload(file) {
      // 扩展名判断
      const fileExtension = this.getFileExtension(file.name)
      if (fileExtension === '') {
        this.$message.error('文件必须有扩展名')
        return false
      }

      if (this.extension !== '') {
        const isFileExtension = this.extensions.includes(fileExtension)
        if (!isFileExtension) {
          this.$message.error('上传文件只能是' + this.extension + '格式!')
          return false
        }
      }
      // 判断文件大小
      const isLimitSize = file.size / 1024 / 1024 < this.limit
      if (!isLimitSize) {
        this.$message.error('上传头像图片大小不能超过 ' + this.limit + 'MB!')
      }
      if (isLimitSize) {
        this.uploadLoading = true
      }
      return isLimitSize
    },
    getFileExtension(fileName) {
      if (fileName.lastIndexOf('.') > 0) {
        return fileName.substring(fileName.lastIndexOf('.') + 1)
      }
      return ''
    }
  }
}
</script>

<style>
  .uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
  .waring-label {
    font-size: 14px;
    color: #9b9d07;
  }
</style>
