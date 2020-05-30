<template>
  <div class="upload-container">
    <el-upload
      :data="uploadData"
      :action="uploadImageUrl"
      :show-file-list="false"
      :on-success="handleAvatarSuccess"
      :before-upload="beforeAvatarUpload"
      class="avatar-uploader"
    >
      <img v-if="imageUrl" :src="imageUrl" class="avatar">
      <i v-else class="el-icon-plus avatar-uploader-icon" />
    </el-upload>
  </div>
</template>

<script>
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
    basePath: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      resultUrl: undefined,
      uploadImageUrl: 'http://' + process.env.VUE_APP_BASE_API + '/json/oss/upload',
      uploadData: { 'base_path': this.basePath }
    }
  },
  computed: {
    imageUrl() {
      return this.resultUrl
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
    if (this.dir !== '') {
      this.uploadImageUrl += '?dir=' + this.dir
    }
  },
  methods: {
    emitInput(val) {
      this.$emit('input', val)
    },
    handleAvatarSuccess(response, file) {
      this.resultUrl = response.data
      this.emitInput(this.resultUrl)
    },
    beforeAvatarUpload(file) {
      const isJPG = (file.type === 'image/jpeg' || file.type === 'image/png')
      const isLt2M = file.size / 1024 / 1024 < 2

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG/PNG 格式!')
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!')
      }
      return isJPG && isLt2M
    }
  }
}
</script>

<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    width: 178px;
    height: 178px;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
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
</style>
