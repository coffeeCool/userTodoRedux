import 'shelljs/make'
import dd from 'ddeyes'
import userRedux from '../../src/testServices/redux'

target.all = ->
  dd 'hello userTodoRedux ！'

target.static = ->
  userRedux.staticFuc()

target.reducers = ->
  userRedux.reducersFuc()

target.sagas = ->
  data = await userRedux.createFuc()
  await userRedux.loginFuc data
  await userRedux.fetchFuc data
  await userRedux.reloadFuc()
  data_patch = await userRedux.patchFuc data
  await userRedux.removeFuc data_patch
