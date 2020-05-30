<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <el-input v-model="listQuery.fileName" style="width: 200px;" class="filter-item" placeholder="请输入附件名称" @keyup.enter.native="handleFilter" />
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
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
      <el-table-column width="200" align="center" label="文件名称">
        <template slot-scope="scope">
          <span>{{ scope.row.fileName }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="文件路径">
        <template slot-scope="scope">
          <span><a :href="scope.row.filePath" target="_blank">{{ scope.row.filePath }}</a></span>
        </template>
      </el-table-column>
      <el-table-column width="90" align="center" label="文件大小">
        <template slot-scope="scope">
          <span>{{ scope.row.fileSize }} K</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="扩展名">
        <template slot-scope="scope">
          <span>{{ scope.row.fileExtension }}</span>
        </template>
      </el-table-column>
      <el-table-column width="160" align="center" label="上传时间">
        <template slot-scope="scope">
          <span>{{ scope.row.uploadTime | parseTime('{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>
      <el-table-column width="120" align="center" label="上传的IP">
        <template slot-scope="scope">
          <span>{{ scope.row.uploadIp }}</span>
        </template>
      </el-table-column>

      <el-table-column :label="$t('table.actions')" width="80" align="center" class-name="small-padding fixed-width">
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
import { fetchAttachmentList, deleteAttachment, batchDeleteAttachment } from '@/api/oss/attachment'
import waves from '@/directive/waves' // 水波纹指令

export default {
  name: 'SysSendlogList',
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
      },
      showReviewer: false,
      multipleSelection: []
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchAttachmentList(this.listQuery).then(response => {
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
        phone: '',
        code: '',
        data: ''
      }
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    handleDelete(row) {
      deleteAttachment(row.id).then(() => {
        this.$message.success('删除成功')
        const index = this.list.indexOf(row)
        this.list.splice(index, 1)
      })
    },
    handleBatchDelete() {
      if (this.multipleSelection.length) {
        const list = this.multipleSelection
        var ids = []
        list.forEach(function(value, index, array) {
          ids.push(value.id)
        })
        var idsStr = ids.join(',')
        batchDeleteAttachment(idsStr).then(response => {
          if (response.data.code === 0) {
            this.$message.success('提交成功')
            this.$refs.multipleTable.clearSelection()
            this.getList()
          }
        }).catch(() => {
        })
        this.getList()
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
