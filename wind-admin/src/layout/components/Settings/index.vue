<template>
  <div>
    <svg-icon icon-class="setting" @click="click" />
    <el-drawer :visible.sync="show" size="400">
      <div class="drawer-container">
        <h3 class="drawer-title">{{ $t('settings.title') }}</h3>

        <div class="drawer-item">
          <span>{{ $t('settings.theme') }}</span>
          <theme-picker style="float: right;height: 26px;margin: -3px 8px 0 0;" @change="themeChange" />
        </div>

        <div class="drawer-item">
          <span>{{ $t('settings.tagsView') }}</span>
          <el-switch v-model="tagsView" class="drawer-switch" />
        </div>

        <div class="drawer-item">
          <span>{{ $t('settings.topMenu') }}</span>
          <el-switch v-model="topMenu" class="drawer-switch" />
        </div>

        <div class="drawer-item">
          <span>{{ $t('settings.fixedHeader') }}</span>
          <el-switch v-model="fixedHeader" class="drawer-switch" />
        </div>

        <div class="drawer-item">
          <span>{{ $t('settings.sidebarLogo') }}</span>
          <el-switch v-model="sidebarLogo" class="drawer-switch" />
        </div>

      </div>
    </el-drawer>
  </div>
</template>

<script>
import ThemePicker from '@/components/ThemePicker'

export default {
  name: 'Setting',
  components: { ThemePicker },
  data() {
    return {
      show: false
    }
  },
  computed: {
    fixedHeader: {
      get() {
        return this.$store.state.settings.fixedHeader
      },
      set(val) {
        this.$store.dispatch('settings/changeSetting', {
          key: 'fixedHeader',
          value: val
        })
      }
    },
    topMenu: {
      get() {
        return this.$store.state.settings.topMenu
      },
      set(val) {
        this.$store.dispatch('settings/changeSetting', {
          key: 'topMenu',
          value: val
        })
        this.$store.dispatch('permission/toggleMenu')
      }
    },
    tagsView: {
      get() {
        return this.$store.state.settings.tagsView
      },
      set(val) {
        this.$store.dispatch('settings/changeSetting', {
          key: 'tagsView',
          value: val
        })
      }
    },
    sidebarLogo: {
      get() {
        return this.$store.state.settings.sidebarLogo
      },
      set(val) {
        this.$store.dispatch('settings/changeSetting', {
          key: 'sidebarLogo',
          value: val
        })
      }
    }
  },
  methods: {
    themeChange(val) {
      this.$store.dispatch('settings/changeSetting', {
        key: 'theme',
        value: val
      })
    },
    click() {
      this.show = true
    }
  }
}
</script>

<style lang="scss" scoped>
.drawer-container {
  padding: 24px;
  font-size: 14px;
  line-height: 1.5;
  word-wrap: break-word;

  .drawer-title {
    margin-bottom: 12px;
    color: rgba(0, 0, 0, .85);
    font-size: 14px;
    line-height: 22px;
  }

  .drawer-item {
    color: rgba(0, 0, 0, .65);
    font-size: 14px;
    padding: 12px 0;
  }

  .drawer-switch {
    float: right
  }
}
</style>
