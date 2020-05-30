import request from '@/utils/request'

export function fetchList(query) {
  return request({
    url: '/sms/template/list',
    method: 'get',
    params: query
  })
}

export function fetchTemplate() {
  return request({
    url: '/sms/template/detail',
    method: 'get'
  })
}

export function createTemplate(data) {
  return request({
    url: '/sms/template/add',
    method: 'post',
    data
  })
}

export function updateTemplate(data) {
  return request({
    url: '/sms/template/update',
    method: 'post',
    data
  })
}

export function deleteTemplate(id) {
  return request({
    url: '/sms/template/delete/' + id,
    method: 'post'
  })
}

