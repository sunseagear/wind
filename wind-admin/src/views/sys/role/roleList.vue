<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <el-input v-model="listQuery.name" style="width: 200px;" class="filter-item" placeholder="请输入角色名称" @keyup.enter.native="handleFilter" />
      <el-input v-model="listQuery.code" style="width: 200px;" class="filter-item" placeholder="请输入角色编码" @keyup.enter.native="handleFilter" />
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
      <el-table-column width="200" align="center" label="角色名称">
        <template slot-scope="scope">
          <span>{{ scope.row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column width="150" label="角色编码">
        <template slot-scope="scope">
          <span>{{ scope.row.code }}</span>
        </template>
      </el-table-column>
      <el-table-column width="200" align="center" label="是否可用">
        <template slot-scope="scope">
          <span>{{ scope.row.usable | dictLabel('sf') }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('table.actions')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="small" type="text" icon="el-icon-setting" @click="toSetMenu(scope.row)">设置权限</el-button>
          <el-button size="small" type="text" icon="el-icon-finished" @click="toSetDataRule(scope.row)">数据权限</el-button>
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

    <role-form ref="form" @refreshList="getList" />
    <!--设置权限-->
    <role-setting-form ref="settingForm" />

    <role-data-rule-list ref="ruleForm" />
  </div>
</template>

<script>
import { fetchList, deleteRole } from '@/api/sys/role'
import roleDataRuleList from '../roleDataRule/roleDataRuleList'
import waves from '@/directive/waves'
import RoleForm from './roleForm'
import RoleSettingForm from './roleSettingForm' // 水波纹指令

export default {
  name: 'SysRoleList',
  components: { RoleSettingForm, RoleForm, roleDataRuleList },
  directives: {
    waves
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
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchList(this.listQuery).then(response => {
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
    toSetMenu(row) {
      this.$refs.settingForm.toSetMenu(row)
    },
    handleUpdate(row) {
      this.$refs.form.handleUpdate(row)
    },
    handleCreate() {
      this.$refs.form.handleCreate()
    },
    handleDelete(row) {
      this.$confirm('确定删除该数据吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteRole(row.id).then(response => {
          if (response.data.code === 0) {
            this.getList()
            this.$message.success(response.data.msg)
          } else {
            this.$message.error(response.data.msg)
          }
        })
      })
    },
    toSetDataRule(row) {
      this.$refs.ruleForm.handleRoleDataRuleUpdate(row.id)
    }
  }
}
</script>
