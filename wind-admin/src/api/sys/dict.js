import request from '@/utils/request'

export function fetchDicts() {
  return request({
    url: '/sys/dict',
    method: 'get'
  })
}

export function fetchDictList(query) {
  return request({
    url: '/sys/dict/list',
    method: 'get',
    params: query
  })
}

export function fetchDict() {
  return request({
    url: '/sys/dict/detail',
    method: 'get'
  })
}

export function createDict(data) {
  return request({
    url: '/sys/dict/add',
    method: 'post',
    data
  })
}

export function updateDict(data) {
  return request({
    url: '/sys/dict/update',
    method: 'post',
    data
  })
}

export function deleteDict(id) {
  return request({
    url: '/sys/dict/delete/' + id,
    method: 'post'
  })
}

