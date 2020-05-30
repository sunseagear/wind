import request from '@/utils/request'

export function fetchTenantList(data) {
  return request({
    url: '/sys/tenant/list',
    method: 'post',
    data
  })
}

export function getTenant(id) {
  return request({
    url: '/sys/tenant/detail/' + id,
    method: 'get'
  })
}

export function createTenant(data) {
  return request({
    url: '/sys/tenant/add',
    method: 'post',
    data
  })
}

export function updateTenant(data) {
  return request({
    url: '/sys/tenant/update',
    method: 'post',
    data
  })
}

export function deleteTenant(id) {
  return request({
    url: '/sys/tenant/delete/' + id,
    method: 'post'
  })
}

export function batchTenant(ids) {
  return request({
    url: '/sys/tenant/batch/delete',
    method: 'post',
    data: { ids }
  })
}
