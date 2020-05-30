import request from '@/utils/request'

export function fetchConfigList(data) {
  return request({
    url: '/sys/config/list',
    method: 'post',
    data
  })
}

export function getConfig(id) {
  return request({
    url: '/sys/config/detail/' + id,
    method: 'get'
  })
}

export function createConfig(data) {
  return request({
    url: '/sys/config/add',
    method: 'post',
    data
  })
}

export function updateConfig(data) {
  return request({
    url: '/sys/config/update',
    method: 'post',
    data
  })
}

export function deleteConfig(id) {
  return request({
    url: '/sys/config/delete/' + id,
    method: 'post'
  })
}

export function batchConfig(ids) {
  return request({
    url: '/sys/config/batch/delete',
    method: 'post',
    data: { ids }
  })
}

