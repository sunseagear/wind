<template>
  <el-dialog :title="title" :visible.sync="iconFormVisible" :close-on-click-modal="false">
    <el-form ref="addIconForm" :model="temp" label-position="left" label-width="120px" style="width: 90%; margin-left:9%;">
      <el-scrollbar style="height: 550px">
        <ui-icons @listenIcon="showIcon" />
      </el-scrollbar>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="iconFormVisible = false">{{ $t('table.cancel') }}</el-button>
      <el-button type="primary" @click="addCreateData($event)">{{ $t('table.confirm') }}</el-button>
    </div>
  </el-dialog>
</template>

<script>
export default {
  name: 'IconSelector',
  data() {
    return {
      // isActive: '',
      title: '选择图标',
      temp: {
        addIcon: undefined
      },
      iconFormVisible: false,
      iconStatus: 'create'
    }
  },
  methods: {
    addIcon() {
      this.iconStatus = 'create'
      this.iconFormVisible = true
    },
    showIcon: function(data) {
      this.temp.addIcon = data
    },
    addCreateData(event) {
      // 预处理提交的数据
      this.$emit('iconSelect', this.temp.addIcon)
      this.iconFormVisible = false
    }
  }
}
</script>

<style scoped>

</style>
