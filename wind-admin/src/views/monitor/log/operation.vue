<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <div class="filter-item">
        <span>URI:</span>
        <el-input v-model="listQuery.requestUri" style="width: 200px" />
      </div>
      <div class="filter-item">
        <span>操作IP:</span>
        <el-input v-model="listQuery.operationIp" style="width: 200px" />
      </div>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
      <el-button class="filter-item" type="danger" icon="el-icon-document" @click="handleBatchDelete">删除</el-button>
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
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" align="center" />
      <el-table-column min-width="120" align="center" label="操作标题">
        <template slot-scope="scope">
          <span>{{ scope.row.title }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="80" align="center" label="操作类型">
        <template slot-scope="scope">
          <span>{{ scope.row.logType }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="120" align="center" label="URI">
        <template slot-scope="scope">
          <span>{{ scope.row.requestUri }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="80" align="center" label="操作人">
        <template slot-scope="scope">
          <span>{{ scope.row.operationName }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="80" align="center" label="操作IP">
        <template slot-scope="scope">
          <span>{{ scope.row.operationIp }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="80" align="center" label="浏览器">
        <template slot-scope="scope">
          <span>{{ scope.row.browser }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="100" align="center" label="操作系统">
        <template slot-scope="scope">
          <span>{{ scope.row.os }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="80" align="center" label="请求状态">
        <template slot-scope="scope">
          <el-tag :type="scope.row.status | statusTypeFilter">{{ scope.row.status | statusFilter }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column min-width="160" align="center" label="操作时间">
        <template slot-scope="scope">
          <span>{{ scope.row.createDate | parseTime('{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>

      <el-table-column :label="$t('table.actions')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="small" type="text" icon="el-icon-delete" class="delete-text-btn" @click="handleDelete(scope.row)">{{ $t('table.delete') }}</el-button>
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
import { fetchOperationLogList, deleteOperationLog, batchDeleteOperationLog } from '@/api/monitor/log/operation'
import waves from '@/directive/waves' // 水波纹指令

export default {
  name: 'ScheduleJobLogList',
  directives: {
    waves
  },
  filters: {
    statusTypeFilter(status) {
      const statusMap = {
        '0': 'danger',
        '1': 'success'
      }
      return statusMap[status]
    },
    statusFilter(status) {
      const statusMap = {
        '0': '失败',
        '1': '成功'
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
      fetchOperationLogList(this.listQuery).then(response => {
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
      deleteOperationLog(row.id).then(() => {
        this.$message.success('删除成功')
        const index = this.list.indexOf(row)
        this.list.splice(index, 1)
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
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
        batchDeleteOperationLog(idsStr).then(() => {
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
    },
    change(t) {
      if (t < 10) {
        return '0' + t
      } else {
        return t
      }
    },
    timestampToTime(timestamp) {
      var date = new Date(timestamp * 1000) // 时间戳为10位需*1000，时间戳为13位的话不需乘1000
      const Y = date.getFullYear() + '-'
      const M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-'
      const D = this.change(date.getDate()) + ' '
      const h = this.change(date.getHours()) + ':'
      const m = this.change(date.getMinutes()) + ':'
      const s = this.change(date.getSeconds())
      return Y + M + D + h + m + s
    }
  }
}
</script>
