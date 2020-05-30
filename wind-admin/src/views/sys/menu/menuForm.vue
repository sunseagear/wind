<template>
  <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" :close-on-click-modal="false">
    <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="120px" style="width: 90%; margin-left:50px;">

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="权限类型" prop="type">
            <el-radio
              v-for="item in dictList('menutype')"
              :key="'type' + item.label"
              v-model="temp.type"
              :label="item.value"
              @change="onChangeType"
            >
              {{ item.label }}
            </el-radio>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="是否显示" prop="enabled">
            <el-radio
              v-for="item in dictList('sf')"
              :key="'enabled' + item.label"
              v-model="temp.enabled"
              :label="item.value"
              :disabled="displayDisable"
            >
              {{ item.label }}
            </el-radio>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="是否外链">
            <el-radio
              v-for="item in dictList('sf')"
              :key="'enabled' + item.label"
              v-model="externalLink"
              :label="item.value"
              :disabled="layoutDisable"
              @change="onChangeExternalLink"
            >
              {{ item.label }}
            </el-radio>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="上级菜单" prop="parentIds">
            <el-cascader
              v-model="temp.parentIds"
              :options="list"
              :props="treeProps"
              :show-all-levels="false"
              label="name"
              change-on-select
              clearable
            />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="菜单名称" prop="name">
            <el-input v-model="temp.name" />
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="权限值" prop="permission">
            <el-input v-model="temp.permission" />
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="前端地址" prop="path">
            <el-input v-model="temp.path" :disabled="layoutDisable" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="前端组件" prop="component">
            <el-input v-model="temp.component" :disabled="layoutDisable || externalLinkDisable" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="图标" prop="icon">
            <div id="iconBox" style="display: flex; border: 1px solid #DCDFE6; padding: 0 15px; border-radius: 4px;">
              <i class="fas" :class="['fa-' + temp.icon]" style="line-height: 36px;" />
              <el-input v-model="temp.icon" style="border: none; padding: 0" @click.native="addIcon" />
              <a class="clear" @click="clear1()" />
            </div>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="排序" prop="sort">
            <el-input v-model="temp.sort" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item label="备注">
        <el-input v-model="temp.remarks" :autosize="{ minRows: 2, maxRows: 4}" type="textarea" placeholder="请填写备注" />
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="dialogFormVisible = false">{{ $t('table.cancel') }}</el-button>
      <el-button v-if="dialogStatus=='create'" type="primary" @click="createData">{{ $t('table.confirm') }}</el-button>
      <el-button v-else type="primary" @click="updateData">{{ $t('table.confirm') }}</el-button>
    </div>

    <icon-selector ref="iconSelector" @iconSelect="addCreateData" />

  </el-dialog>
</template>
<script>
import { createMenu, updateMenu } from '@/api/sys/menu'
import iconSelector from '@/components/IconSelector'
import { isExternal } from '../../../utils/validate'

export default {
  name: 'MenuForm',
  components: { iconSelector },
  data() {
    return {
      list: [],
      temp: {},
      rules: {
        type: [{ required: true, message: '菜单名称必填', trigger: 'change' }],
        name: [{ required: true, message: '菜单名称必填', trigger: 'blur' }],
        enabled: [{ required: true, message: '是否可用必选', trigger: 'change' }],
        sort: [{ required: true, message: '排序必填', trigger: 'blur' }],
        cacheable: [{ required: true, message: '是否缓存必选', trigger: 'change' }],
        requireAuth: [{ required: true, message: '是否需要认证必选', trigger: 'change' }]
      },
      treeProps: {
        value: 'id',
        label: 'name'
      },
      externalLink: '0',
      dialogFormVisible: false,
      displayDisable: false,
      layoutDisable: false,
      externalLinkDisable: false,
      iconFormVisible: false,
      dialogStatus: '',
      iconStatus: '',
      textMap: {
        update: '修改菜单',
        create: '添加菜单'
      }
    }
  },
  methods: {
    getList() {
      this.$emit('refreshList')
    },
    setList(list) {
      this.list = list
    },
    clear1() {
      if (this.temp.icon) {
        this.temp.icon = ''
      }
    },
    onChangeType(value) {
      if (value === '1') {
        this.layoutDisable = true
        this.displayDisable = false
      } else if (value === '2') {
        this.layoutDisable = false
        this.displayDisable = false
      } else if (value === '3') {
        this.displayDisable = true
        this.layoutDisable = true
      }
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: '',
        type: '2',
        path: '',
        url: '',
        enabled: '1',
        sort: '0',
        icon: '',
        edirect: '',
        cacheable: 'true',
        requireAuth: 'true',
        component: '',
        remark: ''
      }
      this.externalLink = '0'
    },
    handleCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    addIcon() {
      this.$refs.iconSelector.addIcon()
    },
    onChangeExternalLink(value) {
      if (value === '1') {
        this.externalLinkDisable = true
      } else if (value === '0') {
        this.externalLinkDisable = false
      }
    },
    createData() {
      // 预处理提交的数据
      const parentIds = this.temp.parentIds
      if (parentIds !== undefined && parentIds !== '') {
        if (parentIds instanceof Array && parentIds.length > 0) {
          const parentId = parentIds[parentIds.length - 1]
          this.temp.parentId = parentId
        }
      }
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if (this.temp.parentIds !== undefined && this.temp.parentIds !== '') {
            this.temp.parentIds.length = 0
          }
          createMenu(this.temp).then((response) => {
            const data = response.data
            if (data.code === 0) {
              this.dialogFormVisible = false
              this.$message.success('删除成功')
              this.getList()
            } else {
              this.$message.error(data.msg)
            }
          })
        }
      })
    },
    addCreateData(icon) {
      this.temp.icon = 'fas fa-' + icon
    },
    handleUpdate(row) {
      this.resetTemp()
      this.temp = Object.assign({}, row) // copy obj
      if (this.temp.children !== undefined) {
        this.temp.children.length = 0
      }
      if (this.temp.parentIds !== undefined) {
        let parentIds = this.temp.parentIds.trim()
        if (parentIds.length > 0) {
          parentIds = parentIds.substr(0, parentIds.length - 1)
        }
        this.temp.parentIds = parentIds.split('\/')
      }
      this.temp.enabled = this.temp.enabled + ''
      this.temp.cacheable = this.temp.cacheable + ''
      this.temp.requireAuth = this.temp.requireAuth + ''
      this.externalLink = isExternal(this.temp.path) ? '1' : '0'
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.onChangeType(this.temp.type)
      this.onChangeExternalLink(this.externalLink)
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const parentIds = this.temp.parentIds
          if (parentIds !== undefined && parentIds !== '') {
            if (parentIds instanceof Array && parentIds.length > 0) {
              const parentId = parentIds[parentIds.length - 1]
              this.temp.parentId = parentId
            } else {
              this.temp.parentId = ''
            }
          }
          if (this.temp.parentIds !== undefined && this.temp.parentIds !== '') {
            this.temp.parentIds = undefined
          }
          if (this.temp.parent !== undefined) {
            this.temp.parent = undefined
          }
          const tempData = Object.assign({}, this.temp)
          updateMenu(tempData).then((response) => {
            const data = response.data
            if (data.code === 0) {
              this.getList()
              this.dialogFormVisible = false
              this.$message.success('更新成功')
            } else {
              this.$message.error(data.msg)
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
