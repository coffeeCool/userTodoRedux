import dd from 'ddeyes'
import toolFuc from '../utils/helper'
import services from '../services/index'

export default leanCloudService = ->
  # create user
  results = await services.lc.create toolFuc
  ,
    username: '何文涛'
    password: '123456'
    phoneNo: '110'
  dd results

  # user login 
  data_login = await services.lc.login toolFuc
  , 
    username: '何文涛'
    password: '123456'
  dd data_login

  # fetch user
  data_fetch = await services.lc.fetch toolFuc
  ,
    objectId: data_login.objectId
  dd data_fetch

  # patch user
  data_patch = await services.lc.patch toolFuc
  , 
    sessionToken: data_login.sessionToken
    objectId: data_login.objectId
    username: '陈欢'
    password: '123456'
    phoneNo: '119'
  dd data_patch

  # reload user
  data_reload = await services.lc.reload toolFuc
  dd data_reload

  # remove user
  data_remove = await services.lc.remove toolFuc
  , 
    sessionToken: data_patch.sessionToken
    objectId: data_patch.objectId
  dd data_remove

  # reload user
  data_reload = await services.lc.reload toolFuc
  dd data_reload

  # remove all user
  ids = data_reload.results.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []
  for id in ids
    data_removeAll = await services.lc.remove toolFuc
    ,
      sessionToken: data_patch.sessionToken
      objectId: id
    dd data_removeAll
