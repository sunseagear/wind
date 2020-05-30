import request from '@/utils/request'

export function fetchRoleDataRuleList(data) {
  return request({
    url: '/sys/roledatarule/list',
    method: 'post',
    data
  })
}

export function getRoleDataRule(id) {
  return request({
    url: '/sys/roledatarule/detail/' + id,
    method: 'get'
  })
}

export function createRoleDataRule(data) {
  return request({
    url: '/sys/roledatarule/add',
    method: 'post',
    data
  })
}

export function updateRoleDataRule(data) {
  return request({
    url: '/sys/roledatarule/update',
    method: 'post',
    data
  })
}
export function updateRoleDataRules(data) {
  return request({
    url: '/sys/roledatarule/updateRules',
    method: 'post',
    data
  })
}

export function deleteRoleDataRule(id) {
  return request({
    url: '/sys/roledatarule/delete/' + id,
    method: 'post'
  })
}

export function batchRoleDataRule(ids) {
  return request({
    url: '/sys/roledatarule/batch/delete',
    method: 'post',
    data: { ids }
  })
}
