import request from '@/utils/request'

export function fetchList(query) {
  return request({
    url: '/sys/role/list',
    method: 'get',
    params: query
  })
}

export function fetchUsableRoleList() {
  return request({
    url: '/sys/role/usable/list',
    method: 'get'
  })
}

export function addRole(data) {
  return request({
    url: '/sys/role/add',
    method: 'post',
    data
  })
}

export function updateRole(data) {
  return request({
    url: '/sys/role/update',
    method: 'post',
    data
  })
}

export function deleteRole(id) {
  return request({
    url: '/sys/role/delete/' + id,
    method: 'post'
  })
}

export function fetchRoleMenu(roleId) {
  return request({
    url: '/sys/role/' + roleId + '/menu',
    method: 'get'
  })
}

export function fetchRolePermission(roleId) {
  return request({
    url: '/sys/role/' + roleId + '/permission',
    method: 'get'
  })
}

/**
 * 设置权限
 * @param roleId
 */
export function setMenu(data) {
  return request({
    url: '/sys/role/setMenu',
    method: 'post',
    data
  })
}
export function setPermission(data) {
  return request({
    url: '/sys/role/setPermission',
    method: 'post',
    data
  })
}

export function insertByUserId(userid, roleIds) {
  return request({
    url: '/upms/user/role/' + userid + '/insertByUserId',
    method: 'post',
    data: { roleIds }
  })
}

export function deleteByUserId(userid, roleIds) {
  return request({
    url: '/upms/user/role/' + userid + '/deleteByUserId',
    method: 'post',
    data: { roleIds }
  })
}

