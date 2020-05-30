import request from '@/utils/request'

export function fetchOperationLogList(query) {
  return request({
    url: '/monitor/operation/log/list',
    method: 'get',
    params: query
  })
}

export function deleteOperationLog(id) {
  return request({
    url: '/monitor/operation/log/delete/' + id,
    method: 'post'
  })
}

export function batchDeleteOperationLog(ids) {
  return request({
    url: '/monitor/operation/log/batch/delete',
    method: 'post',
    data: { ids }
  })
}
