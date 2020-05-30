<template>
  <div class="ui-fas">
    <el-input v-model="name" suffix-icon="el-icon-search" placeholder="请输入图标名称" @input.native="filterIcons" />
    <el-row>
      <el-col v-for="(item, index) in iconList" :key="index" v-model="temp.addIcon" :span="8" class="colBox" :class="{'active': item == isActive}" @click.native="activeFun($event)">
        <i class="fas" :class="['fa-' + item]" />
        <span class="col-span">{{ item }}</span>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import fontawesome from '@/assets/js/solid.js'
export default {
  name: 'Icon',
  data() {
    return {
      isActive: '',
      name: '',
      iconList: fontawesome,
      temp: {
        addIcon: undefined
      }
    }
  },
  methods: {
    filterIcons() {
      if (this.name) {
        this.iconList = this.iconList.filter(item => item.includes(this.name))
      } else {
        this.iconList = fontawesome
      }
    },
    selectedIcon(name) {
      this.$emit('selected', name)
    },
    activeFun: function(event) {
      this.isActive = event.target.textContent
      this.temp.addIcon = event.target.textContent
      this.$emit('listenIcon', event.target.textContent)
    }
  }
}
</script>
<style lang="stylus" scoped>
  .colBox
    display: flex
    align-items: center
    .col-span
      padding-left: 5px
</style>