import request from '@/utils/request'

export function fetchList(data) {
  return request({
    url: '/sys/user/list',
    method: 'post',
    data
  })
}

export function fetchUser(id) {
  return request({
    url: '/sys/user/detail/' + id,
    method: 'get'
  })
}

export function createUser(data) {
  return request({
    url: '/sys/user/add',
    method: 'post',
    data
  })
}

export function updateUser(data) {
  return request({
    url: '/sys/user/update',
    method: 'post',
    data
  })
}

export function deleteUser(id) {
  return request({
    url: '/sys/user/delete/' + id,
    method: 'post'
  })
}

export function modifyPassword(data) {
  return request({
    url: '/sys/user/' + data.id + '/changePassword',
    method: 'post',
    data
  })
}

export function exportUser(query) {
  return request({
    url: '/sys/user/export',
    method: 'get',
    params: query
  })
}

export function myUpdateUser(data) {
  return request({
    url: '/sys/user/my/update',
    method: 'post',
    data
  })
}

export function myUpdateChangePassword(data) {
  return request({
    url: '/sys/user/my/changePassword',
    method: 'post',
    data
  })
}

export function getInfo() {
  return request({
    url: '/sys/user/info',
    method: 'get'
  })
}

