<template>
  <el-menu :default-active="activeIndex" mode="horizontal">

    <template v-for="(item, index) in menu">
      <!-- 最后一级菜单 -->
      <el-menu-item v-if="!item.hidden && index < visibleNumber" :key="item.id" :index="item.id" @click="click(item)">
        <i :class="item.meta.icon" />
        <span slot="title">{{ item.meta.title }}</span>
      </el-menu-item>
    </template>
    <!-- 顶部菜单超出数量折叠 -->
    <el-submenu v-if="menu.length >= visibleNumber" index="more">
      <template slot="title">更多菜单</template>
      <template v-for="(item, index) in menu">
        <!-- 最后一级菜单 -->
        <el-menu-item v-if="!item.hidden && index >= visibleNumber" :key="item.id" :index="item.id" @click="click(item)">
          <i :class="item.meta.icon" />
          <span slot="title">{{ item.meta.title }}</span>
        </el-menu-item>
      </template>
    </el-submenu>

  </el-menu>
</template>

<script>
import { deepClone } from '@/utils'
import { mapState } from 'vuex'
import { isExternal } from '@/utils/validate'

export default {
  name: 'TopMenu',
  data() {
    return {
      activeIndex: undefined,
      visibleNumber: 10
    }
  },
  computed: {
    ...mapState({
      addMenus: state => state.permission.addMenus
    }),
    menu() {
      const list = []
      this.addMenus.forEach(item => {
        const menu = deepClone(item)
        if (menu.children && menu.children.length !== 0) {
          menu.hasChildren = true
        } else {
          menu.hasChildren = false
        }
        menu.children = undefined
        list.push(menu)
      })
      // console.log('list', list)
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
  beforeMount() {
    window.addEventListener('resize', this.setVisibleNumber)
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.setVisibleNumber)
  },
  created() {
    // this.setVisibleNumber()
    this.updateActiveIndex()
  },
  methods: {
    isExternalUrl(path) {
      return isExternal(path)
    },
    // 根据宽度计算设置显示栏数
    setVisibleNumber() {
      const width = document.body.getBoundingClientRect().width / 3
      this.visibleNumber = parseInt(width / 85)
    },
    click(menu) {
      if (isExternal(menu.path)) {
        window.open(menu.path, '_blank')
      } else if (!menu.hasChildren) {
        this.$router.push({ path: menu.path })
      } else {
        this.$store.dispatch('permission/updateMenu', menu)
      }
    },
    updateActiveIndex() {
      const path = this.$route.path
      this.activeIndex = this.findIndex(this.addMenus, path)
      console.log('this.activeIndex', this.activeIndex)
    },
    findIndex(menuList, path) {
      const menu = menuList.find(item => {
        if (item.path === path) {
          return true
        }
        if (item.children && item.children.length !== 0) {
          const subMenu = this.findIndex(item.children, path)
          if (subMenu) {
            return true
          }
        }
      })
      return menu ? menu.id : menuList[0].id
    }
  }

}
</script>

<style lang="scss">
.el-menu--horizontal > .el-menu-item {
  float: left;
  height: 50px;
  line-height: 50px;
  border-bottom: 3px solid transparent;
  ////color: #999093;
  //padding: 0 5px;
  //margin: 0 10px;
}

.el-menu--horizontal > .el-menu-item.is-active {
  border-bottom: 3px solid transparent;
  //border-bottom: 3px solid #{'var(--theme)'};
  //color: #303133;
}

/* submenu item */
.el-menu--horizontal > .el-submenu .el-submenu__title {
  height: 50px !important;
  line-height: 50px !important;
}
</style>
