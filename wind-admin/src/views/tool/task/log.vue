<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <el-input v-model="listQuery.jobName" style="width: 200px;" class="filter-item" placeholder="请输入任务名称" @keyup.enter.native="handleFilter" />
      <el-input v-model="listQuery.executeClass" style="width: 200px;" class="filter-item" placeholder="请输入执行类" @keyup.enter.native="handleFilter" />

      <el-select v-model="listQuery.status" class="filter-item" placeholder="请选择状态">
        <el-option label="全部状态" value="" />
        <el-option
          v-for="item in statusOptions"
          :key="item.label + 'filter_status'"
          :label="item.label"
          :value="item.value"
        />
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
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
      <el-table-column width="120" align="center" label="任务名称">
        <template slot-scope="scope">
          <span>{{ scope.row.jobName }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="任务分组">
        <template slot-scope="scope">
          <span>{{ scope.row.jobGroup }}</span>
        </template>
      </el-table-column>
      <el-table-column width="120" align="center" label="执行类">
        <template slot-scope="scope">
          <span>{{ scope.row.executeClass }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="方法名">
        <template slot-scope="scope">
          <span>{{ scope.row.methodName }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="方法参数">
        <template slot-scope="scope">
          <span>{{ scope.row.methodParams }}</span>
        </template>
      </el-table-column>
      <el-table-column width="200" align="center" label="日志信息">
        <template slot-scope="scope">
          <span>{{ scope.row.jobMessage }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="状态">
        <template slot-scope="scope">
          <el-tag :type="scope.row.status | statusTypeFilter">{{ scope.row.status | statusFilter }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column width="160" align="center" label="操作时间">
        <template slot-scope="scope">
          <span>{{ scope.row.createTime }}</span>
        </template>
      </el-table-column>

      <el-table-column :label="$t('table.actions')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="small" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)">{{ $t('table.delete') }}
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
import { fetchScheduleJobLogList, deleteScheduleJobLog } from '@/api/tool/task/log'
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
    },
    statusFilter(status) {
      const statusMap = {
        '-1': '失败',
        '0': '普通',
        '1': '成功'
      }
      return statusMap[status + '']
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
      statusOptions: [
        { label: '失败', value: '-1' },
        { label: '普通', value: '0' },
        { label: '成功', value: '1' }
      ]
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchScheduleJobLogList(this.listQuery).then(response => {
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
      deleteScheduleJobLog(row.id).then(() => {
        this.$message.success('删除成功')
        const index = this.list.indexOf(row)
        this.list.splice(index, 1)
      })
    }
  }
}
</script>
