import request from '@/utils/request'

export function login(username, password) {
  const data = {
    grant_type: 'password',
    client_id: 'cloud-upms',
    client_secret: 'cloud-upms',
    username,
    password
  }
  return request({
    url: '/sso/oauth2/access_token',
    method: 'post',
    data
  })
}

export function logout(token) {
  return request({
    url: '/sso/oauth2/revoke_token',
    method: 'post',
    data: { 'access_token': token }
  })
}

export function refreshToken(refresh_token) {
  const data = {
    grant_type: 'refresh_token',
    client_id: 'cloud-upms',
    client_secret: 'cloud-upms',
    refresh_token
  }
  return request({
    url: '/sso/oauth2/refresh_token',
    method: 'post',
    data
  })
}
