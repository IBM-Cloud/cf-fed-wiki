// Licensed under the Apache License. See footer for details.

var cfenv = require("cfenv")

var appEnv = cfenv.getAppEnv()

//------------------------------------------------------------------------------
// create argv for:
// --port <val>
// --url <val>
// --database <val>
// for database, we'll use `{"type": "mongodb", "url": "..."}`
// TODO: add support for Cloudant
//------------------------------------------------------------------------------

var args = []
args.push(process.argv[0])
args.push(process.argv[1])

args.push("--port")
args.push("" + appEnv.port)

args.push("--url")
args.push(appEnv.url.replace("https://", "http://"))

// get the mongodb service, or not

var databaseVal = null

var mongoServiceName = "mongodb-fedwiki"
var mongoCreds       = appEnv.getServiceCreds(mongoServiceName)

if (mongoCreds) {
  var mongoURL = mongoCreds.uri || mongoCreds.url

  if (mongoURL) {
    console.log("service '" + mongoServiceName + "' found; using for storage")

    var mongoOpts = {type: "mongodb", url: mongoURL}
    databaseVal = JSON.stringify(mongoOpts)
  }
}

if (!databaseVal) {
  console.log("no database service found; using file system for storage")
}
else {
  args.push("--database")
  args.push(databaseVal)
}

// set the new process.argv

process.argv = args
console.log("argv: " + args.join(" "))

// kick everything off!
require("wiki")

//------------------------------------------------------------------------------
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//------------------------------------------------------------------------------
