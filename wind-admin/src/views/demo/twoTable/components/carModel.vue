<template>
  <div id="dictComponent">
    <div>
      <div class="filter-container">
        <el-input v-model="listQuery.keyword" style="width: 200px;" class="filter-item" placeholder="请输入汽车型号标签或值" @keyup.enter.native="handleFilter" />
        <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
        <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">{{ $t('table.add') }}</el-button>
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
          prop="name"
          label="汽车型号标签"
          width="160"
        />
        <el-table-column
          prop="value"
          label="汽车型号值"
          width="160"
        />
        <el-table-column :label="$t('table.actions')" align="center" width="180" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button size="small" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">{{ $t('table.edit') }}</el-button>
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
      <car-model-form ref="form" @getList="getList" />
    </div>
  </div>
</template>

<script>
import { fetchCarModelList, deleteCarModel } from '@/api/demo/carModel'
import waves from '@/directive/waves' // 水波纹指令
import carModelForm from './carModelForm' // 水波纹指令

export default {
  name: 'CarModel',
  directives: {
    waves
  },
  components: { carModelForm },
  data() {
    return {
      dictGroup: {},
      tableKey: 0,
      list: null,
      total: null,
      listLoading: false,
      pageArray: this.$store.getters.pageArray,
      listQuery: {
        page: 1,
        limit: this.$store.getters.defaultPageSize,
        title: undefined,
        type: undefined,
        carId: undefined
      },
      showReviewer: false,
      downloadLoading: false
    }
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchCarModelList(this.listQuery).then(response => {
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
    refreshCarModel(row) {
      this.listQuery.carId = row.id
      this.listQuery.page = 1
      this.listQuery.keyword = ''
      this.dictGroup = row
      this.getList()
    },
    handleUpdate(row) {
      this.$refs.form.handleUpdate(row.id)
    },
    handleCreate() {
      this.$refs.form.handleCreate(this.dictGroup)
    },
    handleDelete(row) {
      deleteCarModel(row.id).then((response) => {
        const data = response.data
        if (data.code === 0) {
          this.dialogFormVisible = false
          this.$message.success('删除成功')
          this.getList()
        } else {
          this.$message.error(data.msg)
        }
      })
    }

  }
}
</script>
