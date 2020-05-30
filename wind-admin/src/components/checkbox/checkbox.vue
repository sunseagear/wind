<template>
  <el-checkbox-group v-model="checkList" @change="change">
    <el-checkbox
      v-for="item in list"
      :key="'type' + item.value"
      :label="item[props.value]">
      {{ item[props.label] }}
    </el-checkbox>
  </el-checkbox-group>
</template>

<script>
export default {
  name: 'Checkbox',
  props: {
    value: {
      type: String,
      default: ''
    },
    list: {
      type: Array,
      default() {
        return []
      }
    },
    props: {
      type: Object,
      default() {
        return { value: 'value', label: 'label' }
      }
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
        this.checkList = []
        if (val === undefined || val === '') {
          return
        }
        this.checkList = val.split(',').filter(item => {
          if (item !== '') {
            return true
          }
        })
      }
    }
  },
  methods: {
    change(val) {
      this.$emit('input', val.join(','))
    }

  }

}
</script>

<style scoped>

</style>
