<template>
  <div class="upload-container">
    <el-row :gutter="10">
      <el-col v-for="url in imageList" :key="url" :span="span">
        <div class="avatar-uploader">
          <el-image :src="url" fit="fill" :preview-src-list="imageList" style="width: 100%; height: 100%" />
          <el-button type="danger" circle size="mini" icon="el-icon-delete" class="delete" @click="remove(url)" />
        </div>
      </el-col>
      <el-col v-if="imageList.length < maxCount" :span="span">
        <el-upload
          :data="uploadData"
          :action="uploadImageUrl"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
          class="avatar-uploader"
        >
          <i class="el-icon-plus avatar-uploader-icon" />
        </el-upload>
      </el-col>
    </el-row>
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
    },
    span: {
      type: Number,
      default: 6
    },
    maxCount: {
      type: Number,
      default: 1
    }
  },
  data() {
    return {
      imageList: [],
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
        if (this.isNull(val)) {
          this.imageList = []
          return
        }
        this.imageList = val.split(',')
      }
    }
  },
  created() {
    if (this.dir !== '') {
      this.uploadImageUrl += '?dir=' + this.dir
    }
  },
  methods: {
    remove(url) {
      this.imageList.splice(this.imageList.indexOf(url), 1)
      this.emitInput(this.imageList.join(','))
    },
    emitInput(val) {
      this.$emit('input', val)
    },
    handleAvatarSuccess(response, file) {
      this.imageList.push(response.data)
      this.emitInput(this.imageList.join(','))
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

<style lang="scss" scoped>
  $value: 150px;
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    width: $value;
    height: $value;
    position: relative;
    overflow: hidden;
  }

  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }

  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: $value;
    height: $value;
    line-height: $value;
    text-align: center;
  }

  .avatar-uploader {
    width: $value;
    height: $value;
    margin-top: 10px;
    display: block;
  }

  .delete {
    position: absolute;
    margin-left: -30px;
    margin-top: 3px

  }
</style>
