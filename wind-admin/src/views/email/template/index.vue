<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <el-input v-model="listQuery.name" style="width: 200px;" class="filter-item" placeholder="请输入模版名称" @keyup.enter.native="handleFilter" />
      <el-input v-model="listQuery.code" style="width: 200px;" class="filter-item" placeholder="请输入模版编码" @keyup.enter.native="handleFilter" />
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">{{ $t('table.add') }}</el-button>
    </div>

    <el-table
      :key="tableKey"
      v-loading="listLoading"
      :data="list"
      element-loading-text="给我一点时间"
      border
      fit
      highlight-current-row
      style="width: 100%"
    >
      <el-table-column align="center" label="模版名称">
        <template slot-scope="scope">
          <span>{{ scope.row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column width="180" align="center" label="模版编码">
        <template slot-scope="scope">
          <span>{{ scope.row.code }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('table.actions')" align="center" width="160" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="small" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">{{ $t('table.edit') }}</el-button>
          <el-button size="small" type="text" icon="el-icon-delete" class="delete-text-btn" @click="handleDelete(scope.row)">{{ $t('table.delete') }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="pagination-container">
      <el-pagination
        :current-page.sync="listQuery.page"
        :page-sizes="pageArray"
        :page-size="listQuery.limit"
        :total="total"
        background
        layout="total, sizes, prev, pager, next, jumper"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>

    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="80%">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="120px" style="width: 80%; margin-left:50px;">
        <el-form-item label="模版名称" prop="name">
          <el-input v-model="temp.name" />
        </el-form-item>
        <el-form-item label="模版主题" prop="templateSubject">
          <el-input v-model="temp.templateSubject" />
        </el-form-item>
        <el-form-item label="模版内容" prop="templateContent">
          <el-input id="templateContentTinymce" v-model="temp.templateContent" :height="500" type="textarea" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">{{ $t('table.cancel') }}</el-button>
        <el-button v-if="dialogStatus=='create'" type="primary" @click="createData">{{ $t('table.confirm') }}</el-button>
        <el-button v-else type="primary" @click="updateData">{{ $t('table.confirm') }}</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { fetchTemplateList, createTemplate, deleteTemplate, updateTemplate } from '@/api/email/template'
import waves from '@/directive/waves' // 水波纹指令
import { getDictLabel, getDictList } from '@/utils/dict'

export default {
  name: 'TemplateList',
  directives: {
    waves
  },
  filters: {
    businessTypeFilter(value) {
      return getDictLabel('businesstype', value)
    }
  },
  data() {
    return {
      tableKey: 0,
      list: null,
      total: null,
      listLoading: true,
      pageArray: this.$store.getters.pageArray,
      listQuery: {
        page: 1,
        limit: this.$store.getters.defaultPageSize,
        importance: undefined,
        title: undefined,
        type: undefined
      },
      businessTypeOptions: getDictList('businesstype'),
      showReviewer: false,
      temp: {
        id: undefined,
        name: '',
        code: '',
        businessType: '',
        templateSubject: '',
        templateContent: '',
        configId: '',
        appId: ''

      },
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        update: '编辑模板',
        create: '添加模板'
      },
      dialogPvVisible: false,
      pvData: [],
      rules: {
        appId: [{ required: true, message: '请选择所属应用', trigger: 'blur' }],
        configId: [{ required: true, message: '请选择签名配置', trigger: 'blur' }],
        businessType: [{ required: true, message: '请选择业务类型', trigger: 'blur' }],
        name: [{ required: true, message: '模版名称必填', trigger: 'change' }],
        templateSubject: [{ required: true, message: '模版ID必填', trigger: 'change' }],
        templateContent: [{ required: true, message: '模版内容必填', trigger: 'change' }]
      },
      appList: null,
      configList: null
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchTemplateList(this.listQuery).then(response => {
        this.list = response.data.data
        this.total = response.data.total
        this.listLoading = false
      })
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleSizeChange(val) {
      this.listQuery.limit = val
      this.getList()
    },
    handleCurrentChange(val) {
      this.listQuery.page = val
      this.getList()
    },
    handleModifyStatus(row, status) {
      this.$message({
        message: '操作成功',
        type: 'success'
      })
      row.status = status
    },
    resetTemp() {
      this.temp = {
        id: undefined,
        name: '',
        code: '',
        businessType: '',
        templateSubject: '',
        templateContent: '',
        configId: '',
        appId: ''
      }
    },
    handleCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          createTemplate(this.temp).then(() => {
            this.dialogFormVisible = false
            this.$message.success('创建成功')
            this.getList()
          })
        }
      })
    },
    handleUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.temp)
          updateTemplate(tempData).then(() => {
            this.dialogFormVisible = false
            this.$message.success('更新成功')
            this.getList()
          })
        }
      })
    },
    handleDelete(row) {
      deleteTemplate(row.id).then(() => {
        this.$message.success('删除成功')
        const index = this.list.indexOf(row)
        this.list.splice(index, 1)
      })
    }
  }
}
</script>
