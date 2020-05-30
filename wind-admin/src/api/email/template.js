import request from '@/utils/request'

export function fetchTemplateList(query) {
  return request({
    url: '/email/template/list',
    method: 'get',
    params: query
  })
}

export function fetchTemplate() {
  return request({
    url: '/email/template/detail',
    method: 'get'
  })
}

export function createTemplate(data) {
  return request({
    url: '/email/template/add',
    method: 'post',
    data
  })
}

export function updateTemplate(data) {
  return request({
    url: '/email/template/update',
    method: 'post',
    data
  })
}

export function deleteTemplate(id) {
  return request({
    url: '/email/template/delete/' + id,
    method: 'post'
  })
}

