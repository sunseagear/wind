import request from '@/utils/request'

export function fetchLoginLogList(query) {
  return request({
    url: '/monitor/login/log/list',
    method: 'get',
    params: query
  })
}

export function deleteLoginLog(id) {
  return request({
    url: '/monitor/login/log/delete/' + id,
    method: 'post'
  })
}

export function batchDeleteLoginLog(ids) {
  return request({
    url: '/monitor/login/log/batch/delete',
    method: 'post',
    data: { ids }
  })
}

export function exportLoginLog(query) {
  return request({
    url: '/monitor/login/log/export',
    method: 'get',
    params: query
  })
}
