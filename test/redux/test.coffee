import 'shelljs/make'
import dd from 'ddeyes'
import redux_test from '../../src/testServices/redux'

target.all = ->
  dd 'hello userTodoRedux ！'

target.static = ->
  redux_test.staticFuc()

target.reducers = ->
  redux_test.reducersFuc()

target.sagas = ->
  promiseFuc = ->
    new Promise (resolve, reject) ->
      redux_test.createFuc(resolve, reject)
    .then (data) ->
      await redux_test.sellp 1000
      redux_test.loginFuc data

      await redux_test.sellp 1000
      redux_test.fetchFuc data

      # await redux_test.sellp 1000
      # redux_test.patchFuc data

      await redux_test.sellp 1000
      redux_test.reloadFuc data

      await redux_test.sellp 1000
      redux_test.removeFuc data

  promiseFuc()