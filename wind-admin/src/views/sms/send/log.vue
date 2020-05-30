<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <el-input v-model="listQuery.phone" style="width: 200px;" class="filter-item" placeholder="请输入手机号码" @keyup.enter.native="handleFilter" />
      <el-input v-model="listQuery.sendCode" style="width: 200px;" class="filter-item" placeholder="请输入模板编码" @keyup.enter.native="handleFilter" />

      <el-select v-model="listQuery.status" class="filter-item" placeholder="请选择发送状态">
        <el-option label="全部状态" value="" />
        <el-option
          v-for="item in statusOptions"
          :key="item.label + 'filter_status'"
          :label="item.label"
          :value="item.value"
        />
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
      <el-button :loading="sendMsgLoading" class="filter-item" type="primary" icon="el-icon-document" @click="handleRetrySendMsg">短信重发</el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleSendMsg">发送短信</el-button>
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
      <el-table-column width="120" align="center" label="联系电话">
        <template slot-scope="scope">
          <span>{{ scope.row.phone }}</span>
        </template>
      </el-table-column>
      <el-table-column width="200" align="center" label="模版名称">
        <template slot-scope="scope">
          <span>{{ scope.row.templateName }}</span>
        </template>
      </el-table-column>
      <el-table-column width="120" align="center" label="模版编码">
        <template slot-scope="scope">
          <span>{{ scope.row.sendCode }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="发送状态">
        <template slot-scope="scope">
          <span>{{ scope.row.status|statusFilter }}</span>
        </template>
      </el-table-column>
      <el-table-column width="120" align="center" label="响应消息ID">
        <template slot-scope="scope">
          <span>{{ scope.row.smsid }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="重试次数">
        <template slot-scope="scope">
          <span>{{ scope.row.tryNum }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="返回消息">
        <template slot-scope="scope">
          <span>{{ scope.row.msg }}</span>
        </template>
      </el-table-column>
      <el-table-column width="160" align="center" label="响应时间">
        <template slot-scope="scope">
          <span>{{ scope.row.responseDate }}</span>
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

    <el-dialog :visible.sync="dialogFormVisible" title="发送短信">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="120px" style="width: 400px; margin-left:50px;">
        <el-form-item label="电话号码" prop="phone">
          <el-input
            v-model="temp.phone"
            :autosize="{ minRows: 8, maxRows: 12}"
            type="textarea"
            placeholder="电话号码，多个以英文逗号“,”隔开"
          />
        </el-form-item>
        <el-form-item label="模版编码" prop="code">
          <el-input v-model="temp.code" placeholder="请设置模版编码" />
        </el-form-item>
        <el-form-item label="变量值" prop="data">
          <json-editor ref="jsonEditor" v-model="temp.data" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">{{ $t('table.cancel') }}</el-button>
        <el-button type="primary" @click="runSendMsg">发送短信</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { fetchList, sendMsg, deleteSendlog, retrySend } from '@/api/sms/sendlog'
import waves from '@/directive/waves' // 水波纹指令
import JsonEditor from '@/components/JsonEditor'

export default {
  name: 'SmsSendlogList',
  components: { JsonEditor },
  directives: {
    waves
  },
  filters: {
    statusFilter(status) {
      const statusMap = {
        '-1': '发送失败',
        '0': '发送中',
        '1': '发送成功'
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
      rules: {
        phone: [{ required: true, message: '手机号码必填', trigger: 'blur' }],
        code: [{ required: true, message: '编码必填', trigger: 'blur' }]
      },
      dialogFormVisible: false,
      temp: {
        phone: '',
        code: '',
        data: JSON.parse('{}')
      },
      multipleSelection: [],
      sendMsgLoading: false,
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
    resetTemp() {
      this.temp = {
        phone: '',
        code: '',
        data: JSON.parse('{}')
      }
    },
    handleSendMsg() {
      this.resetTemp()
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    runSendMsg() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          sendMsg(this.temp).then(response => {
            if (response.data.code === 0) {
              this.dialogFormVisible = false
              this.getList()
              this.$message.success(response.data.msg)
            } else {
              this.$message.error(response.data.msg)
            }
          })
        }
      })
    },
    handleDelete(row) {
      deleteSendlog(row.id).then(() => {
        this.$message.success('删除成功')
        const index = this.list.indexOf(row)
        this.list.splice(index, 1)
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    handleRetrySendMsg() {
      if (this.multipleSelection.length) {
        this.sendMsgLoading = true
        const list = this.multipleSelection
        var ids = []
        list.forEach(function(value, index, array) {
          ids.push(value.id)
        })
        var idsStr = ids.join(',')
        retrySend(idsStr).then(() => {
          this.$message.success('提交成功')
          this.$refs.multipleTable.clearSelection()
          this.sendMsgLoading = false
        }).catch(() => {
          this.sendMsgLoading = false
        })
      } else {
        this.$message({
          message: '至少选择一条重发',
          type: 'warning'
        })
      }
    }
  }
}
</script>
