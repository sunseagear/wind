<template>
  <div>
    <el-button type="primary" @click="newRect">添加多边形</el-button>
    <el-button type="primary" @click="clearRect">清除多边形</el-button>
    <el-button v-if="showText" type="primary" @click="addPath">数据画线</el-button>
    <el-input v-if="showText" v-model="path" style="margin-top: 10px; margin-bottom: 10px" />
    <baidu-map :center="center" :scroll-wheel-zoom="true" :zoom="zoom" :style="{height:height,width:width}" @moving="syncCenterAndZoom" @moveend="syncCenterAndZoom" @zoomend="syncCenterAndZoom">
      <bm-polygon :path="polygonPath" :stroke-color="color" :stroke-opacity="opacity" :stroke-weight="weight" :editing="true" @lineupdate="updatePolygonPath" />
    </baidu-map>
  </div>
</template>

<script>
export default {
  name: 'BaiduMapRect',
  props: {
    value: {
      type: String,
      default: undefined
    },
    center: {
      type: [Object, String],
      default: '北京'
    },
    zoom: {
      type: Number,
      default: 15
    },
    color: {
      type: String,
      default: 'blue'
    },
    opacity: {
      type: Number,
      default: 0.5
    },
    weight: {
      type: Number,
      default: 2
    },
    width: {
      type: String,
      default: '100%'
    },
    height: {
      type: String,
      default: '400px'
    },
    showText: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      polygonPath: [],
      mapCenter: {},
      path: undefined
    }
  },
  watch: {
    value: {
      immediate: true,
      handler(val) {
        if (this.value) {
          this.polygonPath = JSON.parse(this.value)
          this.path = this.value
        } else {
          this.polygonPath = []
          this.path = undefined
        }
      }
    }
  },
  created() {
  },
  methods: {
    syncCenterAndZoom(e) {
      const { lng, lat } = e.target.getCenter()
      this.mapCenter.lng = lng
      this.mapCenter.lat = lat
      // this.zoom = e.target.getZoom();
    },
    newRect() {
      const lng = this.mapCenter.lng
      const lat = this.mapCenter.lat
      this.polygonPath = []
      this.polygonPath.push({ lng: lng + 0.01, lat: lat + 0.01 })
      this.polygonPath.push({ lng: lng + 0.01, lat: lat - 0.01 })
      this.polygonPath.push({ lng: lng - 0.01, lat: lat - 0.01 })
      this.polygonPath.push({ lng: lng - 0.01, lat: lat + 0.01 })
      this.updateData()
    },
    clearRect() {
      this.polygonPath = undefined
      this.updateData()
    },
    addPath() {
      try {
        const points = JSON.parse(this.path)
        if (!(points instanceof Array)) {
          this.$message.error('你输入的格式错误')
          return
        }
        let validate = true
        points.find(item => {
          if (!Number(item.lat) || !Number(item.lat)) {
            validate = false
            return true
          }
        })
        if (!validate) {
          this.$message.error('你输入的格式错误')
        }
        this.polygonPath = points
        this.$emit('input', this.path)
      } catch (e) {
        this.$message.error('你输入的格式错误')
      }
    },
    updatePolygonPath(e) {
      this.polygonPath = e.target.getPath()
      this.updateData()
    },
    updateData() {
      this.path = JSON.stringify(this.polygonPath)
      this.path = this.path === '[]' ? undefined : this.path
      this.$emit('input', this.path)
    }

  }
}
</script>

<style scoped>

</style>
