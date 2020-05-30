import request from '@/utils/request'

export function fetchSendLogList(query) {
  return request({
    url: '/email/sendlog/list',
    method: 'get',
    params: query
  })
}

export function sendEmail(data) {
  return request({
    url: '/email/send/massSendEmailByCode',
    method: 'post',
    data
  })
}

export function deleteSendlog(id) {
  return request({
    url: '/email/sendlog/delete/' + id,
    method: 'post'
  })
}

export function retrySend(ids) {
  return request({
    url: '/email/sendlog/retrySend',
    method: 'post',
    data: { ids: ids }
  })
}
