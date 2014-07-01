# Licensed under the Apache License. See footer for details.

path = require "path"

_    = require "underscore"
nopt = require "nopt"

cfFedWiki = require "./cf-fed-wiki"
utils     = require "./utils"

cli = exports

#-------------------------------------------------------------------------------
cli.main = (args) ->
    help() if args.length is 0
    help() if args[0] in ["?", "-?", "--?"]

    opts =
        home:           [ "h", String  ]
        id:             [ "i", String  ]
        verbose:        [ "v", Boolean ]
        help:           [ "h", Boolean ]

    longOpts   = {}
    shortOpts  = {}
    defValues  = {}
    for name, opt of opts
        [shortName, type, defValue] = opt
        defValue = false if type is Boolean

        shortOpts[shortName] = "--#{name}"
        longOpts[name]       = type

        defValues[name] = defValue if defValue?

    parsed = nopt longOpts, shortOpts, args, 0

    help() if parsed.help

    args = parsed.argv.remain
    opts = _.pick parsed, _.keys longOpts
    opts = _.defaults opts, defValues

    utils.verbose opts.verbose

    cfFedWiki.run args, opts

#-------------------------------------------------------------------------------
help = ->
    console.log """
    usage:

        cf-fed-wiki [options]

    options:

        -v --verbose        generate diagnostic messages


    version: #{utils.VERSION}; for more info: #{utils.HOMEPAGE}
    """

    process.exit 1

#-------------------------------------------------------------------------------
cli.main.call null, (process.argv.slice 2) if require.main is module

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
