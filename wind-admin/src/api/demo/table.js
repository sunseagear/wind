import request from '@/utils/request'

export function fetchTableList(data) {
  return request({
    url: '/test/table/table/list',
    method: 'post',
    data
  })
}

export function getTable(id) {
  return request({
    url: '/test/table/table/detail/' + id,
    method: 'get'
  })
}

export function createTable(data) {
  return request({
    url: '/test/table/table/add',
    method: 'post',
    data
  })
}

export function updateTable(data) {
  return request({
    url: '/test/table/table/update',
    method: 'post',
    data
  })
}

export function deleteTable(id) {
  return request({
    url: '/test/table/table/delete/' + id,
    method: 'post'
  })
}

export function batchDelete(ids) {
  return request({
    url: '/test/table/table/batch/delete',
    method: 'post',
    data: { ids }
  })
}
