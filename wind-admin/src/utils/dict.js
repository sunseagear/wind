import store from '@/store'

/**
 * 获取字典列表
 * @param code
 * @returns {*}
 */
export function getDictList(code) {
  return store.getters.dicts[code]
}

/**
 *  通过值获得label
 * @param code
 * @param value
 */
export function getDictLabel(code, value) {
  const dictList = store.getters.dicts[code]
  let label = ''
  dictList.forEach((row) => {
    if (row.value === value) {
      label = row.label
    }
  })
  return label
}

/**
 * 通过label获得值
 * @param code
 * @param label
 * @returns {string}
 */
export function getDictValue(code, label) {
  const dictList = store.getters.dicts[code]
  let value = ''
  dictList.forEach((row) => {
    if (row.label === label) {
      value = row.value
    }
  })
  return value
}
