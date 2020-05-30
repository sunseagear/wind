import request from '@/utils/request'

export function fetchScheduleList(query) {
  return request({
    url: '/task/schedule/job/list',
    method: 'get',
    params: query
  })
}

export function fetchSchedule() {
  return request({
    url: '/task/schedule/job/detail',
    method: 'get'
  })
}

export function createSchedule(data) {
  return request({
    url: '/task/schedule/job/add',
    method: 'post',
    data
  })
}
export function runAJobNow(data) {
  return request({
    url: '/task/schedule/job/runAJobNow',
    method: 'post',
    data
  })
}

export function updateSchedule(data) {
  return request({
    url: '/task/schedule/job/update',
    method: 'post',
    data
  })
}

export function deleteSchedule(id) {
  return request({
    url: '/task/schedule/job/delete/' + id,
    method: 'post'
  })
}

export function batchDeleteSchedule(ids) {
  return request({
    url: '/task/schedule/job/batch/delete',
    method: 'post',
    data: { ids }
  })
}

export function refreshTask(id) {
  return request({
    url: '/task/schedule/job/refreshJob',
    method: 'post'
  })
}

export function refreshSchedule(id) {
  return request({
    url: '/task/schedule/job/' + id + '/updateCron',
    method: 'post'
  })
}

export function changeJobStatus(id, cmd) {
  return request({
    url: '/task/schedule/job/' + id + '/changeJobStatus',
    method: 'post',
    data: { cmd }
  })
}

