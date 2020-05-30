<template>
  <el-dialog :visible.sync="generateButtonDialogFormVisible" title="生成按钮" width="60%" :close-on-click-modal="false">
    <el-form ref="generateButtonDataForm" :rules="generateButtonRules" :model="generateButtonTemp" label-position="left" label-width="120px" style="width: 90%; margin-left:50px;">
      <el-form-item label="父级权限" prop="parentPermission">
        <el-input v-model="generateButtonTemp.parentPermission" />
      </el-form-item>
      <el-form-item label="权限" prop="permission">
        <el-checkbox-group v-model="generateButtonTemp.permission">
          <el-checkbox v-for="item in buttonInit" :key="item.permission" :label="item.permission">
            {{ item.title }}
          </el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-alert
        title="如果选择否，会删除以前菜单下面的所有按钮，请谨慎操作"
        type="warning"
        style="margin-bottom: 20px;"
        show-icon
      />
      <el-form-item label="是否新增" prop="additional">
        <el-radio
          v-for="item in dictList('sf')"
          :key="'enabled' + item.label"
          v-model="generateButtonTemp.additional"
          :label="item.value"
        >
          {{ item.label }}
        </el-radio>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="generateButtonDialogFormVisible = false">{{ $t('table.cancel') }}</el-button>
      <el-button type="primary" @click="generateButton">{{ $t('table.confirm') }}</el-button>
    </div>
  </el-dialog>
</template>
<script>
import { generateButton } from '@/api/sys/menu'
export default {
  name: 'MenuGenButton',
  data() {
    return {
      buttonInit: [
        {
          title: '列表',
          permission: 'list'
        },
        {
          title: '详情',
          permission: 'detail'
        },
        {
          title: '添加',
          permission: 'add'
        },
        {
          title: '更新',
          permission: 'update'
        },
        {
          title: '删除',
          permission: 'delete'
        },
        {
          title: '导出',
          permission: 'export'
        },
        {
          title: '导入',
          permission: 'import'
        }
      ],
      generateButtonTemp: {
        menuId: undefined,
        permission: [],
        parentPermission: '',
        additional: '1'
      },
      generateButtonDialogFormVisible: false,
      generateButtonRules: {
        parentPermission: [{ required: true, message: '父级权限必填', trigger: 'blur' }],
        permission: [{ required: true, message: '请选择权限', trigger: 'change' }],
        additional: [{ required: true, message: '是否新增必选', trigger: 'change' }]
      }
    }
  },
  methods: {
    getList() {
      this.$emit('refreshList')
    },
    resetGenerateButtonTemp(row) {
      this.generateButtonTemp = {
        menuId: row.id,
        permission: [],
        parentPermission: '',
        additional: '1'
      }
    },
    handleGenerateButton(row) {
      this.resetGenerateButtonTemp(row)
      this.generateButtonDialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['generateButtonDataForm'].clearValidate()
      })
    },
    generateButton() {
      this.$refs['generateButtonDataForm'].validate((valid) => {
        if (valid) {
          const permissionTitle = []
          this.generateButtonTemp.permission.forEach((permission, permissionIndex) => {
            this.buttonInit.forEach((item, index) => {
              if (permission === item.permission) {
                permissionTitle[permissionIndex] = item.title
              }
            })
          })
          this.generateButtonTemp.permissionTitles = permissionTitle.join(',')
          this.generateButtonTemp.permissions = this.generateButtonTemp.permission.join(',')
          console.log('generateButton', this.generateButtonTemp)
          generateButton(this.generateButtonTemp).then((response) => {
            if (response.data.code === 0) {
              this.getList()
              this.generateButtonDialogFormVisible = false
              this.$message.success(response.data.msg)
            } else {
              this.$message.error(response.data.msg)
            }
          })
        }
      })
    }

  }
}
</script>

<style scoped>

</style>
