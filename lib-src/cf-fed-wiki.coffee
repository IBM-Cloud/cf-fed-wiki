# Licensed under the Apache License. See footer for details.

path       = require "path"
cfenv      = require "cfenv"
wikiServer = require "wiki-server"

utils = require "./utils"

#-------------------------------------------------------------------------------
appEnv = cfenv.getAppEnv name: utils.PROGRAM

#-------------------------------------------------------------------------------
exports.main = (argv = process.argv.slice(2)) ->
  require("./cli").main argv

#-------------------------------------------------------------------------------
exports.run = (args, opts) ->
  sopts = {}

  opts.verbose     = !! sopts.verbose

  sopts.root       = process.cwd()
  sopts.packageDir = path.join __dirname, "..", "node_modules"
  sopts.port       = appEnv.port
  sopts.home       = "welcome-visitors"
  sopts.data       = path.join sopts.packageDir, "wiki-server", "default-data"
  sopts.client     = path.join sopts.packageDir, "wiki-client", "client"
  sopts.db         = path.join sopts.data, "pages"
  sopts.status     = path.join sopts.data, "status"
  sopts.url        = "http://localhost" + (":" + sopts.port) unless sopts.port is 80
  sopts.id         = path.join sopts.status, "persona.identity"

  #if typeof(sopts.database) is "string"
  #  sopts.database = JSON.parse(sopts.database)
  #sopts.database or= {}
  #sopts.database.type or= "./page"

  #resolve all relative paths
  sopts.root       = path.resolve sopts.root
  sopts.packageDir = path.resolve sopts.packageDir
  sopts.data       = path.resolve sopts.data
  sopts.client     = path.resolve sopts.client
  sopts.db         = path.resolve sopts.db
  sopts.status     = path.resolve sopts.status
  sopts.id         = path.resolve sopts.id

  utils.vlog "version: #{utils.VERSION}"
  utils.vlog "args:    #{args.join " "}"
  utils.vlog "opts:    #{utils.JL opts}"
  utils.vlog "appEnv:  #{utils.JL appEnv}"

  wikiServer sopts

#-------------------------------------------------------------------------------
getUserHome = ->
  process.env.HOME or process.env.HOMEPATH or process.env.USERPROFILE

#-------------------------------------------------------------------------------
# Copyright IBM Corp. 2014
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#-------------------------------------------------------------------------------
