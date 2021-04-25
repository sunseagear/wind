<template>
  <el-menu v-if="topMenu" :default-active="activeIndex" mode="horizontal">
    <el-menu-item v-for="item in menu" :key="item.id" :index="item.id" @click="click(item)">
      <i :class="item.meta.icon" />
      <span slot="title">{{ item.meta.title }}</span>
    </el-menu-item>
  </el-menu>
</template>

<script>
import { deepClone } from '@/utils'
import { mapState } from 'vuex'

export default {
  name: 'TopMenu',
  data() {
    return {
      activeIndex: undefined
    }
  },
  computed: {
    ...mapState({
      addMenus: state => state.permission.addMenus,
      topMenu: state => state.settings.topMenu
    }),
    menu() {
      const list = []
      this.addMenus.forEach(item => {
        const menu = deepClone(item)
        menu.children = undefined
        list.push(menu)
      })
      return list
    }
  },
  watch: {
    menu: {
      immediate: true,
      handler(val) {
        if (this.menu.length !== 0) {
          this.activeIndex = this.menu[0].id
        }
      }
    }

  },
  methods: {
    click(menu) {
      this.$store.dispatch('permission/updateMenu', menu)
    }
  }

}
</script>

<style scoped>

</style>
