<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <div class="filter-item">
        <span>用户名:</span>
        <el-input v-model="listQuery.username" style="width: 200px" />
      </div>
      <div class="filter-item">
        <span>IP:</span>
        <el-input v-model="listQuery.loginIp" style="width: 200px" />
      </div>
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
    >
      <el-table-column min-width="120" align="center" label="用户名">
        <template slot-scope="scope">
          <span>{{ scope.row.realname }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="120" align="center" label="账号">
        <template slot-scope="scope">
          <span>{{ scope.row.username }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="120" align="center" label="登陆IP">
        <template slot-scope="scope">
          <span>{{ scope.row.loginIp }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="120" align="center" label="登录地点">
        <template slot-scope="scope">
          <span>{{ scope.row.loginLocation }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="120" align="center" label="浏览器">
        <template slot-scope="scope">
          <span>{{ scope.row.browser }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="120" align="center" label="操作系统">
        <template slot-scope="scope">
          <span>{{ scope.row.os }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="160" align="center" label="登陆时间">
        <template slot-scope="scope">
          <span>{{ scope.row.startTime | parseTime('{y}-{m}-{d} {h}:{i}') }}</span>
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
import { fetchMonitorUserOnlineList } from '@/api/monitor/user/online'
import waves from '@/directive/waves' // 水波纹指令

export default {
  name: 'MonitorUserOnlineList',
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
        realname: undefined,
        username: undefined,
        loginIp: undefined,
        loginLocation: undefined,
        browser: undefined,
        os: undefined
      },
      showReviewer: false,
      dialogFormVisible: false
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchMonitorUserOnlineList(this.listQuery).then(response => {
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
    }
  }
}
</script>
