import request from '@/utils/request'

export function fetchDictGroupList(query) {
  return request({
    url: '/sys/dict/group/list',
    method: 'get',
    params: query
  })
}

export function fetchDictGroup() {
  return request({
    url: '/sys/dict/group/detail',
    method: 'get'
  })
}

export function createDictGroup(data) {
  return request({
    url: '/sys/dict/group/add',
    method: 'post',
    data
  })
}

export function updateDictGroup(data) {
  return request({
    url: '/sys/dict/group/update',
    method: 'post',
    data
  })
}

export function deleteDictGroup(id) {
  return request({
    url: '/sys/dict/group/delete/' + id,
    method: 'post'
  })
}

