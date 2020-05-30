import request from '@/utils/request'

export function fetchMonitorUserOnlineList(query) {
  return request({
    url: '/monitor/user/online/list',
    method: 'get',
    params: query
  })
}

export function forceLogout(ids) {
  return request({
    url: '/monitor/user/online/forceLogout',
    method: 'post',
    data: { ids }
  })
}
