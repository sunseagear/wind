<template>
  <div>
    <el-row :gutter="gutter">
      <el-col v-for="(item, index) in imageList" :key="index" :span="span">
        <el-image :src="item" :preview-src-list="imageList" :style="{'margin-top': gutter, width: width, height: height}" :fit="fit" />
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  name: 'ImageGallery',
  props: {
    value: {
      type: [String, Array],
      required: false,
      default: ''
    },
    fit: {
      type: String,
      required: false,
      default: 'fill'
    },
    span: {
      type: Number,
      required: false,
      default: 8
    },
    width: {
      type: String,
      required: false,
      default: '100%'
    },
    height: {
      type: String,
      required: false,
      default: '100%'
    },
    gutter: {
      type: Number,
      required: false,
      default: 10
    }
  },
  data() {
    return {
      imageList: []
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
        if (val instanceof Array) {
          this.imageList = val
        } else {
          this.imageList = val.split(',')
        }
      }
    }
  }
}
</script>

<style scoped>

</style>
