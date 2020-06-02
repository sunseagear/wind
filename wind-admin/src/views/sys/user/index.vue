<template>
  <el-row>
    <el-col :span="6">
      <div class="app-container calendar-list-container">
        <div id="treeBox" class="filter-container">
          <el-table :data="treeList" style="width: 100%;" row-key="id" border @row-click="submitForm">
            <el-table-column prop="name" label="名称" sortable />
          </el-table>
        </div>
      </div>
    </el-col>
    <el-col :span="18">
      <div class="app-container calendar-list-container">
        <div class="filter-container">
          <el-input v-model="listQuery.realname" style="width: 200px;" class="filter-item" placeholder="请输入姓名" @keyup.enter.native="handleFilter" />
          <el-input v-model="listQuery.username" style="width: 200px;" class="filter-item" placeholder="请输入用户名" @keyup.enter.native="handleFilter" />
          <el-input v-model="listQuery.phone" style="width: 200px;" class="filter-item" placeholder="请输入手机号码" @keyup.enter.native="handleFilter" />
          <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
          <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">{{ $t('table.add') }}</el-button>
          <el-button v-waves :loading="downloadLoading" class="filter-item" type="primary" icon="el-icon-download" @click="handleDownload">{{ $t('table.export') }}</el-button>
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
          <el-table-column width="150" align="center" label="姓名">
            <template slot-scope="scope">
              <span>{{ scope.row.realname }}</span>
            </template>
          </el-table-column>
          <el-table-column width="120" label="用户名">
            <template slot-scope="scope">
              <span>{{ scope.row.username }}</span>
            </template>
          </el-table-column>
          <el-table-column width="120" align="center" label="联系电话">
            <template slot-scope="scope">
              <span>{{ scope.row.phone }}</span>
            </template>
          </el-table-column>
          <el-table-column width="160" align="center" label="可否登录">
            <template slot-scope="scope">
              <el-tag :type="scope.row.status | statusFilter">
                {{ scope.row.status | dictLabel('sf') }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column width="160" align="center" label="部门">
            <template slot-scope="scope">
              <span>{{ scope.row.organization.name }}</span>
            </template>
          </el-table-column>
          <el-table-column :label="$t('table.actions')" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button size="small" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">{{ $t('table.edit') }}</el-button>
              <el-button size="small" type="text" icon="el-icon-delete" class="delete-text-btn" @click="handleDelete(scope.row)">{{ $t('table.delete') }}</el-button>
              <el-button size="small" type="text" icon="el-icon-user" @click="toAssignRoles(scope.row)">设置角色</el-button>
              <el-button size="small" type="text" icon="el-icon-refresh" @click="handleModifyPassword(scope.row)">重置密码</el-button>
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

        <user-form ref="form" @refreshList="getList" />

        <el-dialog :visible.sync="dialogFormPasswordVisible" title="修改密码">
          <el-form ref="dataModifyForm" :rules="modifyPasswordRules" :model="modifyPassword" label-position="left" label-width="100px" style="width: 400px; margin-left:50px;">
            <el-form-item label="初始密码" prop="password">
              <el-input v-model="modifyPassword.password" type="password" />
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormPasswordVisible = false">{{ $t('table.cancel') }}</el-button>
            <el-button type="primary" @click="postModifyPassword">{{ $t('table.confirm') }}</el-button>
          </div>
        </el-dialog>

        <el-dialog :visible.sync="dialogFormRolesVisible" title="设置角色">
          <el-transfer
            v-model="userRoleIds"
            :filterable="true"
            :props="{key: 'id',label: 'name'}"
            :titles="['可选角色', '已有角色']"
            :button-texts="['撤回', '设置']"
            :format="{noChecked: '${total}', hasChecked: '${checked}/${total}'}"
            :data="roleList"
            @change="handleChangeRoles"
          />
        </el-dialog>

      </div>
    </el-col>
  </el-row>

</template>

<script>
import { fetchList, deleteUser, modifyPassword, exportUser } from '@/api/sys/user'
import { fetchOrganizationList } from '@/api/sys/organization'
import { fetchUsableRoleList } from '@/api/sys/role'
import { fetchUserRoleIds, insertByUserId, deleteByUserId } from '@/api/sys/userRole'
import waves from '@/directive/waves' // 水波纹指令
import userForm from './userForm'

export default {
  name: 'SysUserList',
  components: { userForm },
  directives: {
    waves
  },
  filters: {
    statusFilter(status) {
      const statusMap = {
        1: 'success',
        0: 'danger'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      treeList: [],
      treeProps: {
        value: 'id',
        label: 'name'
      },
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
        type: undefined,
        organization: {
          id: undefined
        }
      },
      downloadLoading: false,
      dialogFormRolesVisible: false,
      roleList: [],
      userRoleIds: [],
      selectCurentUserId: null,
      modifyPassword: {
        id: undefined,
        password: undefined
      },
      dialogFormPasswordVisible: false,
      modifyPasswordRules: {
        password: [{ required: true, message: '请输入密码', trigger: 'blur' }]
      }
    }
  },
  created() {
    this.getTreeList()
    this.getList()
    this.getUsableRoleList()
  },
  methods: {
    getTreeList() {
      this.listLoading = true
      fetchOrganizationList(this.listQuery).then(response => {
        this.treeList = response.data.data
        this.listLoading = false
      })
    },
    submitForm(data) {
      console.log(data)
      this.listQuery.organization.id = data.id
      this.getList()
    },
    getList() {
      this.listLoading = true
      fetchList(this.listQuery).then(response => {
        this.list = response.data.data
        this.total = response.data.total
        this.listLoading = false
      })
    },
    getUsableRoleList() {
      fetchUsableRoleList().then(response => {
        this.roleList = response.data.data
      })
    },
    getUserRoleIds(userId) {
      fetchUserRoleIds(userId).then(response => {
        this.userRoleIds = response.data
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
    handleCreate() {
      this.$refs.form.handleCreate()
    },
    handleUpdate(row) {
      this.$refs.form.handleUpdate(row)
    },
    handleModifyPassword(row) {
      this.modifyPassword.id = row.id // copy obj
      this.dialogFormPasswordVisible = true
      this.$nextTick(() => {
        this.$refs['dataModifyForm'].clearValidate()
      })
    },
    postModifyPassword() {
      this.$refs['dataModifyForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.modifyPassword)
          modifyPassword(tempData).then(response => {
            if (response.data.code === 0) {
              this.dialogFormPasswordVisible = false
              this.$message.success(response.data.msg)
            } else {
              this.$message.error(response.data.msg)
            }
          })
        }
      })
    },
    handleDelete(row) {
      this.$confirm('确定删除该数据吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteUser(row.id).then(response => {
          if (response.data.code === 0) {
            this.getList()
            this.$message.success(response.data.msg)
          } else {
            this.$message.error(response.data.msg)
          }
        })
      })
    },
    handleInsertByUserId(selectCurentUserId, roleIds) {
      var idsStr = roleIds.join(',')
      insertByUserId(selectCurentUserId, idsStr).then((response) => {
        if (response.data.code === 0) {
          this.$message.success('设置成功')
        } else {
          this.$message.error(response.data.msg)
        }
      })
    },
    handleDeleteByUserId(selectCurentUserId, roleIds) {
      var idsStr = roleIds.join(',')
      deleteByUserId(selectCurentUserId, idsStr).then((response) => {
        if (response.data.code === 0) {
          this.$message('撤回成功')
        } else {
          this.$message.error(response.data.msg)
        }
      })
    },
    handleDownload() {
      this.downloadLoading = false
      exportUser(this.listQuery).then(response => {
        this.downloadLoading = true
        if (response.data.code === 0) {
          import('@/vendor/Export2Excel').then(excel => {
            excel.export_byte_to_excel(response.data.data.bytes, response.data.data.title)
            this.downloadLoading = false
          })
        } else {
          this.$message.error(response.data.msg)
        }
      })
    },
    toAssignRoles(row) {
      this.selectCurentUserId = row.id
      this.dialogFormRolesVisible = true
      this.getUserRoleIds(this.selectCurentUserId)
    },
    handleChangeRoles(value, direction, movedKeys) {
      if (direction === 'left') {
        this.handleDeleteByUserId(this.selectCurentUserId, movedKeys)
      } else {
        this.handleInsertByUserId(this.selectCurentUserId, movedKeys)
      }
    }
  }
}
</script>
<style lang="scss">
#treeBox {
  margin-top: 1px;
  .el-table thead {
    display: none;
  }
}
</style>
