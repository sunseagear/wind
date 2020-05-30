<template>
  <el-dialog :visible.sync="dialogFormMenuVisible" title="设置权限"><!-- :fullscreen="true" 全屏-->
    <el-form ref="dataForm" :model="menuTemp" label-position="left" label-width="120px" style="width: 400px; margin-left:50px;">
      <el-form-item label="操作权限">
        <el-tree
          ref="menuTree"
          :data="menuData"
          :props="menuTreeProps"
          :default-checked-keys="selectMenuIds"
          default-expand-all
          show-checkbox
          node-key="id"
        />
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="dialogFormMenuVisible = false">{{ $t('table.cancel') }}</el-button>
      <el-button type="primary" @click="handleChangeMenus">设置权限</el-button>
    </div>
  </el-dialog>
</template>

<script>
import { fetchRoleMenu, setMenu } from '@/api/sys/role'

export default {
  name: 'RoleSettingForm',
  data() {
    return {
      dialogFormMenuVisible: false,
      menuData: null,
      selectCurentRoleId: '',
      selectMenuIds: [],
      menuTemp: {
        menuIds: ''
      },
      menuTreeProps: {
        children: 'children',
        label: 'name'
      }
    }
  },
  methods: {
    getRoleMenus(roleId, menuModule) {
      fetchRoleMenu(roleId, menuModule).then(response => {
        this.menuData = response.data.data.menus
        this.selectMenuIds = response.data.data.selectMenuIds
      })
    },
    toSetMenu(row) {
      this.selectCurentRoleId = row.id
      this.dialogFormMenuVisible = true
      this.getRoleMenus(this.selectCurentRoleId, this.menuTemp.module)
    },
    changeMenu() {
      this.getRoleMenus(this.selectCurentRoleId, this.menuTemp.module)
    },
    handleChangeMenus() {
      const checkedKeys = this.$refs.menuTree.getCheckedKeys()
      const menuIds = checkedKeys.join(',')
      const postData = { roleId: this.selectCurentRoleId, menuIds: menuIds, module: this.menuTemp.module }
      setMenu(postData).then(response => {
        const data = response.data
        if (data.code === 0) {
          this.dialogFormMenuVisible = false
          this.$message.success('设置成功')
        } else {
          this.$message.error(data.msg)
        }
      })
    }

  }
}
</script>

<style scoped>

</style>
