<template>
  <el-checkbox-group v-model="checkList" @change="change">
    <el-checkbox
      v-for="item in dictList(dictCode)"
      :key="'type' + item.value"
      :label="item.value">
      {{ item.label }}
    </el-checkbox>
  </el-checkbox-group>
</template>

<script>
export default {
  name: 'CheckboxDict',
  props: {
    value: {
      type: String,
      default: ''
    },
    dictCode: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      checkList: []
    }
  },
  watch: {
    value: {
      immediate: true,
      handler(val) {
        console.log('value', val)
        if (val === undefined || val === '') {
          return
        }
        this.checkList = val.split(',').filter(item => {
          if (item !== '') {
            return true
          }
        })
        console.log('checkList', this.checkList)
      }
    }
  },
  methods: {
    change(val) {
      console.log('change', val)
      this.$emit('input', val.join(','))
    }

  }

}
</script>

<style scoped>

</style>
