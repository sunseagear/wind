<template>
  <div class="app-container">
    <div class="filter-container">
      <div class="filter-item">
        <span>资源编号:</span>
        <el-input v-model="listQuery.resourceCode" placeholder="请输入资源编号" style="width: 200px" />
      </div>
      <div class="filter-item">
        <span>数据权限名称:</span>
        <el-input v-model="listQuery.scopeName" placeholder="请输入数据权限名称" style="width: 200px" />
      </div>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        {{ $t('table.search') }}
      </el-button>
      <el-button v-permission="['sys:datarule:add']" class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">
        {{ $t('table.add') }}
      </el-button>
    </div>

    <el-table
      :key="tableKey"
      v-loading="listLoading"
      :data="list"
      border
      fit
      highlight-current-row
      style="width: 100%;">
      <el-table-column label="资源编号" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.resourceCode }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据权限名称" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.scopeName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据权限字段" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.scopeField }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数据权限类型" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.scopeType | dictLabel('dataRuleType') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button v-permission="['sys:datarule:update']" size="small" type="text" icon="el-icon-edit" @click="handleUpdate(row)">
            {{ $t('table.edit') }}
          </el-button>
          <el-button v-permission="['sys:datarule:delete']" size="small" type="text" icon="el-icon-delete" class="delete-text-btn" @click="handleDelete(row)">
            {{ $t('table.delete') }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" :page-sizes="pageArray" @pagination="getList" />

    <data-rule-form ref="form" @refreshList="getList" />

  </div>
</template>

<script>
import { deleteDataRule, fetchDataRuleList } from '@/api/sys/dataRule/dataRule'
import waves from '@/directive/waves' // waves directive
import permission from '@/directive/permission/permission'
import dataRuleForm from './dataRuleForm'
import Pagination from '@/components/Pagination'

export default {
  name: 'DataRuleList',
  components: { dataRuleForm, Pagination },
  directives: { waves, permission },
  data() {
    return {
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      pageArray: this.$store.getters.pageArray,
      listQuery: {
        resourceCode: undefined,
        scopeName: undefined,
        page: 1,
        limit: this.$store.getters.defaultPageSize
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchDataRuleList(this.listQuery).then(response => {
        this.list = response.data.data
        this.total = response.data.total
        // Just to simulate the time of the request
        this.listLoading = false
      })
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },

    handleUpdate(row) {
      this.$refs.form.handleUpdate(row.id)
    },
    handleDelete(row) {
      this.$confirm('确定删除该数据吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteDataRule(row.id).then(response => {
          if (response.data.code === 0) {
            this.getList()
            this.$message.success(response.data.msg)
          } else {
            this.$message.error(response.data.msg)
          }
        })
      })
    },
    handleCreate() {
      this.$refs.form.handleCreate()
    }
  }
}
</script>
