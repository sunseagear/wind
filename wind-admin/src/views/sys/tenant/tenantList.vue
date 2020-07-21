<template>
  <div class="app-container">
    <div class="filter-container">
      <div class="filter-item">
        <span>租户标识:</span>
        <el-input v-model="listQuery.tenantId" placeholder="请输入租户标识" style="width: 200px" />
      </div>
      <div class="filter-item">
        <span>联系人:</span>
        <el-input v-model="listQuery.contact" placeholder="请输入联系人" style="width: 200px" />
      </div>
      <div class="filter-item">
        <span>电话:</span>
        <el-input v-model="listQuery.phone" placeholder="请输入电话" style="width: 200px" />
      </div>
      <div class="filter-item">
        <span>租户名称:</span>
        <el-input v-model="listQuery.name" placeholder="请输入租户名称" style="width: 200px" />
      </div>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        {{ $t('table.search') }}
      </el-button>
      <el-button v-permission="['sys:tenant:add']" class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">
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
      <el-table-column label="租户标识" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.tenantId }}</span>
        </template>
      </el-table-column>
      <el-table-column label="联系人" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.contact }}</span>
        </template>
      </el-table-column>
      <el-table-column label="电话" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.phone }}</span>
        </template>
      </el-table-column>
      <el-table-column label="租户名称" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column label="登录名" min-width="150px">
        <template slot-scope="{row}">
          <span>{{ row.userName }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button v-permission="['sys:tenant:update']" size="small" type="text" icon="el-icon-edit" @click="handleUpdate(row)">
            {{ $t('table.edit') }}
          </el-button>
          <el-button v-permission="['sys:tenant:delete']" size="small" type="text" icon="el-icon-delete" class="delete-text-btn" @click="handleDelete(row)">
            {{ $t('table.delete') }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" :page-sizes="pageArray" @pagination="getList" />

    <tenant-form ref="form" @refreshList="getList" />

  </div>
</template>

<script>
import { deleteTenant, fetchTenantList } from '@/api/sys/tenant/tenant'
import waves from '@/directive/waves' // waves directive
import permission from '@/directive/permission/permission'
import tenantForm from './tenantForm'
import Pagination from '@/components/Pagination'

export default {
  name: 'TenantList',
  components: { tenantForm, Pagination },
  directives: { waves, permission },
  data() {
    return {
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      pageArray: this.$store.getters.pageArray,
      listQuery: {
        tenantId: undefined,
        contact: undefined,
        phone: undefined,
        name: undefined,
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
      fetchTenantList(this.listQuery).then(response => {
        this.list = response.data.data
        this.total = response.data.total
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
        deleteTenant(row.id).then(response => {
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
