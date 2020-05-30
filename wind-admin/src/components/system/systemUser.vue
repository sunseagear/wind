<template>
  <div>
    <el-input v-model="name" :style="{width: width}" readonly @focus="show">
      <el-button slot="append" icon="el-icon-search" @click="show" />
    </el-input>
    <el-dialog title="选择用户" :visible.sync="dialogFormVisible" destroy-on-close append-to-body>
      <div class="app-container calendar-list-container">
        <div class="filter-container">
          <el-input v-model="listQuery.realname" style="width: 200px;" class="filter-item" placeholder="请输入姓名" @keyup.enter.native="handleFilter" />
          <el-input v-model="listQuery.username" style="width: 200px;" class="filter-item" placeholder="请输入用户名" @keyup.enter.native="handleFilter" />
          <el-input v-model="listQuery.phone" style="width: 200px;" class="filter-item" placeholder="请输入手机号码" @keyup.enter.native="handleFilter" />
          <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
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
          <el-table-column
            width="50" align="center" label="选择">
            <template slot-scope="scope">
              <el-radio v-model="selectCurentUserId" :label="scope.row.id" @change="selectUser(scope.row)"><i /></el-radio>
            </template>
          </el-table-column>
          <el-table-column min-width="120" align="center" label="姓名">
            <template slot-scope="scope">
              <span>{{ scope.row.realname }}</span>
            </template>
          </el-table-column>
          <el-table-column min-width="120" align="center" label="用户名">
            <template slot-scope="scope">
              <span>{{ scope.row.username }}</span>
            </template>
          </el-table-column>
          <el-table-column min-width="120" align="center" label="联系电话">
            <template slot-scope="scope">
              <span>{{ scope.row.phone }}</span>
            </template>
          </el-table-column>
          <el-table-column min-width="120" align="center" label="部门">
            <template slot-scope="scope">
              <span>{{ scope.row.organization.name }}</span>
            </template>
          </el-table-column>
        </el-table>

        <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" :page-sizes="pageArray" @pagination="getList" />
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">
          {{ $t('table.cancel') }}
        </el-button>
        <el-button type="primary" @click="select">
          {{ $t('table.confirm') }}
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { fetchList, fetchUser } from '@/api/sys/user'
import { objectMerge } from '@/utils/index'
import waves from '@/directive/waves' // 水波纹指令
import Pagination from '@/components/Pagination'

export default {
  name: 'SystemUser',
  components: { Pagination },
  directives: {
    waves
  },
  props: {
    value: {
      type: String,
      default: undefined
    },
    width: {
      type: String,
      default: '100%'
    },
    query: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  data() {
    return {
      tableKey: 0,
      list: null,
      total: null,
      listLoading: true,
      name: undefined,
      pageArray: this.$store.getters.pageArray,
      listQuery: {
        page: 1,
        limit: this.$store.getters.defaultPageSize
      },
      dialogFormVisible: false,
      selectCurentUserId: undefined
    }
  },
  watch: {
    value: {
      immediate: true,
      handler(val) {
        this.getUserInfo()
      }
    }
  },
  created() {
    this.name = undefined
    this.listQuery = objectMerge(this.listQuery, this.query)
    console.log('listQuery', this.listQuery)
    this.getList()
  },
  methods: {
    show() {
      this.dialogFormVisible = true
    },
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
    selectUser(row) {
      this.selectCurentUserId = row.id
      this.name = row.realname + '(' + row.username + ')'
    },
    select() {
      if (this.selectCurentUserId === undefined) {
        this.$message.warning('请选择一个用户')
        return
      }
      this.$emit('input', this.selectCurentUserId)
      this.dialogFormVisible = false
    },
    getUserInfo() {
      this.name = undefined
      if (this.value === undefined) {
        return
      }
      fetchUser(this.value).then(response => {
        if (response.data.code === 0) {
          this.name = response.data.data.realname + '(' + response.data.data.username + ')'
        }
      })
    }
  }

}
</script>

