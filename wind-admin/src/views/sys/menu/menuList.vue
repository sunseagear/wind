<template>
  <div class="app-container calendar-list-container">
    <div class="filter-container">
      <el-input v-model="listQuery.keyword" style="width: 200px;" class="filter-item" placeholder="请输入菜单名称" @keyup.enter.native="handleFilter" />
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">{{ $t('table.search') }}</el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">{{ $t('table.add') }}</el-button>
    </div>

    <el-table v-loading="listLoading" :data="list" style="width: 100%;" row-key="id" border lazy :load="load">
      <el-table-column prop="name" label="名称" width="180" />
      <el-table-column width="150" label="前端地址">
        <template slot-scope="scope">
          <span>{{ scope.row.path }}</span>
        </template>
      </el-table-column>
      <el-table-column width="150" label="前端组件">
        <template slot-scope="scope">
          <span>{{ scope.row.component }}</span>
        </template>
      </el-table-column>
      <el-table-column width="80" align="center" label="排序">
        <template slot-scope="scope">
          <el-input v-model="scope.row.sort" size="mini" @change="handleChangeSort(scope.row.id, scope.row.sort)" />
        </template>
      </el-table-column>
      <el-table-column width="150" label="图标">
        <template slot-scope="scope">
          <i :class="scope.row.icon" />
          <span>{{ scope.row.icon }}</span>
        </template>
      </el-table-column>
      <el-table-column width="100" align="center" label="是否可用">
        <template slot-scope="scope">
          <span>{{ scope.row.enabled | dictLabel('sf') }}</span>
        </template>
      </el-table-column>
      <el-table-column :label="$t('table.actions')" align="center" class-name="small-padding fixed-width"><!-- fixed="right" width="300"-->
        <template slot-scope="scope">
          <el-button size="small" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">{{ $t('table.edit') }}</el-button>
          <el-button size="small" type="text" icon="el-icon-delete" class="delete-text-btn" @click="handleDelete(scope.row)">{{ $t('table.delete') }}</el-button>
          <el-button v-if="scope.row.type == '2'" size="small" type="text" icon="el-icon-coordinate" @click="handleGenerateButton(scope.row)">生成按钮</el-button>
        </template>
      </el-table-column>
    </el-table>

    <menu-form ref="form" @refreshList="getList" />

    <menu-gen-button ref="genButtonFrom" @refreshList="getList" />
  </div>
</template>

<script>
import { fetchMenuList, deleteMenu, changeSort } from '@/api/sys/menu'
import waves from '@/directive/waves' // 水波纹指令
import MenuForm from './menuForm'
import MenuGenButton from './menuGenButton'

export default {
  name: 'MenuComponent',
  directives: {
    waves
  },
  components: { MenuGenButton, MenuForm },
  data() {
    return {
      expandAll: true,
      tableKey: 0,
      list: [],
      listLoading: true,
      listQuery: {
        keyword: undefined
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      this.list = []
      fetchMenuList(this.listQuery).then(response => {
        if (response.data.code === 0) {
          this.list = response.data.data
        } else {
          this.$message.error(response.data.msg)
        }
        this.listLoading = false
      })
    },
    load(tree, treeNode, resolve) {
      resolve(tree.children)
    },
    handleFilter() {
      this.getList()
    },
    handleGenerateButton(row) {
      this.$refs.genButtonFrom.handleGenerateButton(row)
    },
    handleChangeSort(rowId, value) {
      changeSort(rowId, value).then(response => {
        if (response.data.code === 0) {
          this.$message.success(response.data.msg)
          // this.getList()
        } else {
          this.$message.error(response.data.msg)
        }
      })
    },
    handleUpdate(row) {
      this.$refs.form.setList(this.list)
      this.$refs.form.handleUpdate(row)
    },
    handleCreate() {
      this.$refs.form.setList(this.list)
      this.$refs.form.handleCreate()
    },
    handleDelete(row) {
      this.$confirm('确认要删除菜单么?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteMenu(row.id).then(response => {
          const data = response.data
          if (data.code === 0) {
            this.$message.success('删除成功')
            this.getList()
          } else {
            this.$message.error(data.errmsg)
          }
        })
      })
    }
  }
}
</script>
<style lang="stylus">
  .active {
    background-color: #0088CC;
    color: #FFFFFF;
  }

  .el-col-8 {
    padding: 5px;
  }

  .cell .fa {
    font-size: 16px;
    margin: 0;
  }

  .fa {
    font-size: 20px;
    margin: 1px 10px;
  }

  .el-scrollbar__wrap {
    overflow-x: hidden;
  }

  .el-input {
    width: 100%;
  }

  .clear {
    /* display: block; */
    position: absolute;
    width: 15px;
    height: 15px;
    right: 2%;
    top: 50%;
    transform: translate(-2%,-50%);
    background: url('../../../assets/img/clear.png');
    background-size:100% 100%;
  }
  .input::-ms-clear { display: none; }
  .input:valid + .clear { display: inline; }

  #iconBox
    .el-input__inner
      border: none
      padding-left: 5px
</style>

