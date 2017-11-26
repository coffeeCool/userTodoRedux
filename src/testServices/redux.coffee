import dd from 'ddeyes'
import * as store from '../store'

{
  constants
  actions
  reducers
  sagas
  getStore
} = store

myStore = getStore {
  appName: 'userApp'
  reducers
  sagas
}

# static
staticFuc = ->
  dd {
    constants
    actions
  }

# reducers
reducersFuc = ->
  myStore = getStore {
    appName: 'userApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }
  myStore.dispatch actions.userSave
    data: [
      username: '何文涛'
      password: '123456'
      phoneNo: '110'
    ]
  myStore.onsubscribe()

# sellp function
sellp = (time) ->
  return new Promise (resolve, ms)->
    setTimeout ->
      resolve()
    , time

# create user  
createFuc = ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.userCreate 
      data:
        username: '何文涛'
        password: '123456'
        phoneNo: '110'
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

    await sellp 1000
    dd myStore.getState()

loginFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.userLogin
      data:
        username: '何文涛'
        password: '123456'
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

    await sellp 1000
    dd myStore.getState()

# fetch user
fetchFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.userFetch
      data:
        objectId: data.objectId
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

    await sellp 1000
    dd myStore.getState()

# patch user
patchFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.userPatch
      data:
        sessionToken: data.sessionToken
        objectId: data.objectId
        username: '陈欢'
        password: '123456'
        phoneNo: '119'
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

    await sellp 1000
    dd myStore.getState()

# reload class
reloadFuc = ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.userReload
      data: ''
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

    await sellp 1000
    dd myStore.getState()

# remove user
removeFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.userRemove
      data:
        sessionToken: data.sessionToken
        objectId: data.objectId
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data
          
    await sellp 1000
    dd myStore.getState()

# get ids
getIds = (data) ->
  data.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []

export default redux_userTest = {
  createFuc
  loginFuc
  fetchFuc
  patchFuc
  reloadFuc
  removeFuc
  getIds
  sellp
  reducersFuc
  staticFuc
}