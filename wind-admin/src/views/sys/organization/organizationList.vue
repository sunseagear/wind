<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">{{ $t('table.add') }}</el-button>
    </div>
    <el-table v-loading="listLoading" :data="list" style="width: 100%;" row-key="id" border>
      <el-table-column prop="name" label="名称" width="180" />
      <el-table-column label="备注">
        <template slot-scope="scope">
          <span style="color:sandybrown">{{ scope.row.remarks }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="small" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">{{ $t('table.edit') }}</el-button>
          <el-button size="small" type="text" icon="el-icon-delete" class="delete-text-btn" @click="handleDelete(scope.row)">{{ $t('table.delete') }}</el-button>
        </template>
      </el-table-column>
    </el-table>

    <organization-form ref="form" @refreshList="getList" />

  </div>
</template>

<script>
import { fetchOrganizationList, deleteOrganization } from '@/api/sys/organization'
import waves from '@/directive/waves'
import OrganizationForm from './organizationForm' // 水波纹指令

export default {
  name: 'OrganizationList',
  components: { OrganizationForm },
  directives: {
    waves
  },
  data() {
    return {
      tableKey: 0,
      list: [],
      total: null,
      listLoading: true
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      this.list = []
      fetchOrganizationList(this.listQuery).then(response => {
        const organizationList = response.data.data
        for (var i = 0; i < organizationList.length; i++) {
          this.list.push({
            id: organizationList[i].id,
            name: organizationList[i].name,
            children: organizationList[i].children
          })
        }
        this.$refs.form.setList(this.list)
        this.listLoading = false
      })
    },
    handleCreate() {
      this.$refs.form.handleCreate()
    },
    handleUpdate(row) {
      this.$refs.form.handleUpdate(row)
    },
    handleDelete(row) {
      this.$confirm('确定删除该数据吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteOrganization(row.id).then(response => {
          if (response.data.code === 0) {
            this.getList()
            this.$message.success(response.data.msg)
          } else {
            this.$message.error(response.data.msg)
          }
        })
      })
    }
  }
}
</script>
