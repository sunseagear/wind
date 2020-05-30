import request from '@/utils/request'

export function fetchList(query) {
  return request({
    url: '/sms/sendlog/list',
    method: 'get',
    params: query
  })
}

export function sendMsg(data) {
  return request({
    url: 'sms/send/massSendSmsByCode',
    method: 'post',
    data
  })
}

export function deleteSendlog(id) {
  return request({
    url: '/sms/sendlog/delete/' + id,
    method: 'post'
  })
}

export function retrySend(ids) {
  return request({
    url: '/sms/sendlog/retrySend',
    method: 'post',
    data: { ids: ids }
  })
}
