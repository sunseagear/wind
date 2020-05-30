<template>
  <div class="menu-wrapper">
    <template v-for="item in menu">
      <app-link v-if="isExternalUrl(item.path) && !item.children && !item.hidden" :key="item.id" :to="item.path">
        <el-menu-item index="">
          <i :class="item.meta.icon" />
          <span slot="title">{{ item.meta.title }}</span>
        </el-menu-item>
      </app-link>

      <!-- 最后一级菜单 -->
      <el-menu-item v-else-if="!item.children && !item.hidden" :key="item.id" :index="item.path">
        <i :class="item.meta.icon" />
        <span slot="title">{{ item.meta.title }}</span>
      </el-menu-item>

      <!-- 此菜单下还有子菜单 -->
      <el-submenu v-else-if="item.children && !item.hidden" :key="item.id" :index="item.id">
        <template slot="title">
          <i :class="item.meta.icon" />
          <span>{{ item.meta.title }}</span>
        </template>
        <!-- 递归 -->
        <sidebar-item
          :menu="item.children"
        />
      </el-submenu>
    </template>
  </div>
</template>

<script>
import AppLink from './Link'
import { isExternal } from '@/utils/validate'

export default {
  name: 'SidebarItem',
  components: { AppLink },
  props: {
    menu: {
      type: Array,
      required: true
    }
  },
  data() {
    return {}
  },
  methods: {
    isExternalUrl(path) {
      return isExternal(path)
    }
  }
}
</script>

<style scoped>
  .title {
    color: #fff;
  }
  .el-menu-item [class^="el-icon-"] {
    margin-right: 5px;
    text-align: center;
    width: 20px;
    font-size: 18px;
    vertical-align: middle;
  }
  i {
    margin-right: 5px;
    text-align: center;
    width: 20px;
    font-size: 16px;
    vertical-align: middle;
  }
</style>

