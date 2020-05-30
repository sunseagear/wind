import request from '@/utils/request'

export function fetchCarModelList(data) {
  return request({
    url: '/test/twotable/carmodel/list',
    method: 'post',
    data
  })
}

export function getCarModel(id) {
  return request({
    url: '/test/twotable/carmodel/detail/' + id,
    method: 'get'
  })
}

export function createCarModel(data) {
  return request({
    url: '/test/twotable/carmodel/add',
    method: 'post',
    data
  })
}

export function updateCarModel(data) {
  return request({
    url: '/test/twotable/carmodel/update',
    method: 'post',
    data
  })
}

export function deleteCarModel(id) {
  return request({
    url: '/test/twotable/carmodel/delete/' + id,
    method: 'post'
  })
}

