<template>
  <div id="carComponent">
    <div>
      <div class="filter-container">
        <el-input v-model="listQuery.keyword" style="width: 200px;" class="filter-item" placeholder="请输入品牌名称或编码" @keyup.enter.native="handleFilter" />
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
        @row-click="refreshCarModel"
      >
        <el-table-column
          prop="name"
          label="品牌名称"
          width="160"
        />
        <el-table-column
          prop="code"
          label="品牌编码"
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
      <car-form ref="form" @getList="getList" />
    </div>
  </div>
</template>

<script>
import { fetchCarList, deleteCar } from '@/api/demo/car'
import waves from '@/directive/waves' // 水波纹指令
import carForm from './carForm' // 水波纹指令

export default {
  name: 'Car',
  directives: {
    waves
  },
  components: { carForm },
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
        title: undefined,
        type: undefined
      },
      showReviewer: false
    }
  },
  created() {
    this.getList()
  },
  methods: {
    refreshCarModel(row) {
      this.$emit('refreshCarModel', row)
    },
    getList() {
      this.listLoading = true
      fetchCarList(this.listQuery).then(response => {
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
    handleUpdate(row) {
      this.$refs.form.handleUpdate(row.id)
    },
    handleCreate() {
      this.$refs.form.handleCreate()
    },
    handleDelete(row) {
      deleteCar(row.id).then((response) => {
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
