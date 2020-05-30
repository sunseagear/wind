import request from '@/utils/request'

export function fetchCarList(data) {
  return request({
    url: '/test/twotable/car/list',
    method: 'post',
    data
  })
}

export function getCar(id) {
  return request({
    url: '/test/twotable/car/detail/' + id,
    method: 'get'
  })
}

export function createCar(data) {
  return request({
    url: '/test/twotable/car/add',
    method: 'post',
    data
  })
}

export function updateCar(data) {
  return request({
    url: '/test/twotable/car/update',
    method: 'post',
    data
  })
}

export function deleteCar(id) {
  return request({
    url: '/test/twotable/car/delete/' + id,
    method: 'post'
  })
}

