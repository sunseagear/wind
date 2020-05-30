import request from '@/utils/request'

export function fetchExpandTableList(data) {
  return request({
    url: '/test/expandtable/expandtable/list',
    method: 'post',
    data
  })
}

export function getExpandTable(id) {
  return request({
    url: '/test/expandtable/expandtable/detail/' + id,
    method: 'get'
  })
}

export function createExpandTable(data) {
  return request({
    url: '/test/expandtable/expandtable/add',
    method: 'post',
    data
  })
}

export function updateExpandTable(data) {
  return request({
    url: '/test/expandtable/expandtable/update',
    method: 'post',
    data
  })
}

export function deleteExpandTable(id) {
  return request({
    url: '/test/expandtable/expandtable/delete/' + id,
    method: 'post'
  })
}

export function batchExpandTable(ids) {
  return request({
    url: '/test/expandtable/expandtable/batch/delete',
    method: 'post',
    data: { ids }
  })
}
