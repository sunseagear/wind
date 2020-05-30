<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <el-select v-model="listQuery.status" class="filter-item" placeholder="请选择登陆状态">
        <el-option label="全部状态" value="" />
        <el-option
          v-for="item in dictList('loginstatus')"
          :key="item.label + 'loginstatus'"
          :label="item.label"
          :value="item.value"
        />
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
      <el-button :loading="downloadLoading" class="filter-item" type="primary" icon="el-icon-download" @click="handleDownload">导出</el-button>
      <el-button :loading="batchDeleteLoading" class="filter-item" type="danger" icon="el-icon-delete" @click="handleBatchDelete">删除</el-button>
    </div>

    <el-table
      ref="multipleTable"
      :key="tableKey"
      v-loading="listLoading"
      :data="list"
      element-loading-text="给我一点时间"
      border
      fit
      highlight-current-row
      tyle="width: 100%"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" align="center" />
      <el-table-column width="120" align="center" label="登陆用户">
        <template slot-scope="scope">
          <span>{{ scope.row.loginName }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="登陆IP">
        <template slot-scope="scope">
          <span>{{ scope.row.loginIp }}</span>
        </template>
      </el-table-column>
      <el-table-column width="120" align="center" label="登录地点">
        <template slot-scope="scope">
          <span>{{ scope.row.loginLocation }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="浏览器">
        <template slot-scope="scope">
          <span>{{ scope.row.browser }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="操作系统">
        <template slot-scope="scope">
          <span>{{ scope.row.os }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="登陆状态">
        <template slot-scope="scope">
          <el-tag :type="scope.row.status | statusTypeFilter">{{ scope.row.status | dictLabel('loginstatus') }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column width="200" align="center" label="操作信息">
        <template slot-scope="scope">
          <span>{{ scope.row.msg }}</span>
        </template>
      </el-table-column>
      <el-table-column width="160" align="center" label="操作时间">
        <template slot-scope="scope">
          <span>{{ scope.row.loginTime | parseTime('{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>

      <el-table-column :label="$t('table.actions')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
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
  </div>
</template>

<script>
import { fetchLoginLogList, deleteLoginLog, batchDeleteLoginLog, exportLoginLog } from '@/api/monitor/log/login'
import waves from '@/directive/waves' // 水波纹指令

export default {
  name: 'ScheduleJobLogList',
  directives: {
    waves
  },
  filters: {
    statusTypeFilter(status) {
      const statusMap = {
        '-1': 'danger',
        '0': 'info',
        '1': 'success'
      }
      return statusMap[status]
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
      showReviewer: false,
      dialogFormVisible: false,
      multipleSelection: [],
      batchDeleteLoading: false,
      downloadLoading: false,
      statusOptions: [
        { label: '发送失败', value: '-1' },
        { label: '发送中', value: '0' },
        { label: '发送成功', value: '1' }
      ]
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchLoginLogList(this.listQuery).then(response => {
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
    handleDelete(row) {
      deleteLoginLog(row.id).then(() => {
        this.$message.success('删除成功')
        const index = this.list.indexOf(row)
        this.list.splice(index, 1)
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    handleDownload() {
      this.downloadLoading = false
      exportLoginLog(this.listQuery).then(response => {
        this.downloadLoading = true
        if (response.data.code === 0) {
          import('@/vendor/Export2Excel').then(excel => {
            excel.export_byte_to_excel(response.data.bytes, response.data.title)
            this.downloadLoading = false
          })
        } else {
          this.$message.error(response.data.errmsg)
        }
      })
    },
    handleBatchDelete() {
      if (this.multipleSelection.length) {
        this.batchDeleteLoading = true
        const list = this.multipleSelection
        var ids = []
        list.forEach(function(value, index, array) {
          ids.push(value.id)
        })
        var idsStr = ids.join(',')
        batchDeleteLoginLog(idsStr).then(() => {
          this.$message.success('提交成功')
          this.$refs.multipleTable.clearSelection()
          this.batchDeleteLoading = false
          this.getList()
        }).catch(() => {
          this.batchDeleteLoading = false
        })
      } else {
        this.$message({
          message: '至少选择一条日志',
          type: 'warning'
        })
      }
    }
  }
}
</script>
