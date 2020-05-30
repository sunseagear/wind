<template>
  <el-table :data="list" style="width: 100%;padding-top: 15px;">
    <el-table-column label="Order_No" min-width="200">
      <template slot-scope="scope">
        {{ scope.row.order_no | orderNoFilter }}
      </template>
    </el-table-column>
    <el-table-column label="Price" width="195" align="center">
      <template slot-scope="scope">
        ¥{{ scope.row.price | toThousandFilter }}
      </template>
    </el-table-column>
    <el-table-column label="Status" width="100" align="center">
      <template slot-scope="scope">
        <el-tag :type="scope.row.status | statusFilter"> {{ scope.row.status }}</el-tag>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>

export default {
  filters: {
    statusFilter(status) {
      const statusMap = {
        success: 'success',
        pending: 'danger'
      }
      return statusMap[status]
    },
    orderNoFilter(str) {
      return str.substring(0, 30)
    }
  },
  data() {
    return {
      list: null
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.list = [{ order_no: 'A_6455813', price: 121.3, status: 'success' },
        { order_no: 'A_6455814', price: 164.3, status: 'success' },
        { order_no: 'A_6455815', price: 156.52, status: 'pending' },
        { order_no: 'A_6455816', price: 178.4, status: 'success' },
        { order_no: 'A_6455817', price: 86.89, status: 'pending' },
        { order_no: 'A_6455818', price: 1821.63, status: 'success' }]
    }
  }
}
</script>
