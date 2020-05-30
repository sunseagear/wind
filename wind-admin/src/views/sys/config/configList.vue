<template>
  <div class="app-container">
    <div class="filter-container">
      <div class="filter-item">
        <span>配置名称:</span>
        <el-input v-model="listQuery.name" placeholder="请输入配置名称" style="width: 200px" />
      </div>
      <div class="filter-item">
        <span>配置编码:</span>
        <el-input v-model="listQuery.code" placeholder="请输入配置编码" style="width: 200px" />
      </div>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        {{ $t('table.search') }}
      </el-button>
      <el-button v-permission="['sys:config:add']" class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">
        {{ $t('table.add') }}
      </el-button>
    </div>
    <el-table
      :key="tableKey"
      v-loading="listLoading"
      :data="list"
      border
      highlight-current-row
      style="width: 100%;"
    >
      <el-table-column label="配置名称" class-name="status-col" width="350px">
        <template slot-scope="{row}">
          {{ row.name }}
        </template>
      </el-table-column>
      <el-table-column label="配置编码" class-name="status-col" width="350px">
        <template slot-scope="{row}">
          {{ row.code }}
        </template>
      </el-table-column>
      <el-table-column label="参数值" class-name="status-col">
        <template slot-scope="{row}">
          {{ row.value }}
        </template>
      </el-table-column>
      <el-table-column label="备注" class-name="status-col">
        <template slot-scope="{row}">
          {{ row.remarks }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="{row}">
          <el-button v-permission="['sys:tenant:update']" size="small" type="text" icon="el-icon-edit" @click="handleUpdate(row)">
            {{ $t('table.edit') }}
          </el-button>
          <el-button v-if="!row.isSys" v-permission="['sys:tenant:delete']" size="small" type="text" icon="el-icon-delete" class="delete-text-btn" @click="handleDelete(row)">
            {{ $t('table.delete') }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <config-form ref="form" @refreshList="getList" />
  </div>
</template>

<script>
import { fetchConfigList, deleteConfig } from '@/api/sys/config'
import permission from '@/directive/permission/permission'
import waves from '@/directive/waves' // waves directive
import configForm from './configForm'

export default {
  name: 'Config',
  components: { configForm },
  directives: { waves, permission },
  data() {
    return {
      tableKey: 0,
      list: null,
      listLoading: true,
      listQuery: {
        name: undefined,
        code: undefined,
        page: 1,
        limit: this.$store.getters.defaultPageSize
      },
      pageArray: this.$store.getters.pageArray
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchConfigList(this.listQuery).then(response => {
        this.listLoading = false
        if (response.data.code === 0) {
          this.list = response.data.data
        }
      })
    },
    handleCreate() {
      this.$refs.form.handleCreate()
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleUpdate(row) {
      this.$refs.form.handleUpdate(row)
    },
    handleDelete(row) {
      this.$confirm('确定删除该数据吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteConfig(row.id).then(response => {
          if (response.data.code === 0) {
            this.getList()
            this.$message.success(response.data.msg)
          } else {
            this.$message.error(response.data.msg)
          }
        })
      })
    }
  }
}
</script>

