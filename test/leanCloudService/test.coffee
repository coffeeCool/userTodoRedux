import 'shelljs/make'
import leanCloudService from '../../src/testServices/leanCloudService'

target.all = ->
  leanCloudService()
