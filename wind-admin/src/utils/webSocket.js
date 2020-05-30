import store from '@/store'

var webSocket

export function webSocketConnect(onMessage) {
  console.log('process.env.VUE_APP_BASE_API', process.env.VUE_APP_BASE_API)
  webSocket = new WebSocket(('ws://' + process.env.VUE_APP_BASE_API + '/json/web/server/' + store.getters.info.id).replace('//', '/'))
  initWebSocket(onMessage)
}

export function initWebSocket(onMessage) {
  webSocket.onerror = onError // 通讯异常
  webSocket.onopen = onOpen // 连接成功
  webSocket.onclose = onClose // 连接关闭时回调
  webSocket.onmessage = (event) => {
    console.log('onMessage', event)
    onMessage(event)
  } // 收到消息时回调
}

export function onError() {
  /*
  * 通讯异常
  * */
  console.log('通讯异常')
}

export function onOpen() {
  /*
  * 连接成功
  * */
  console.log('通讯开始')
}

export function onClose() {
  /*
  * 关闭连接时回调函数
  * */
  console.log('通讯关闭')
}

export function webSocketSend(message) {
  console.log('webSokcetSend', message)
  webSocket.send(JSON.stringify(message))
}

export function webSocketClose() {
  webSocket.close()
}
