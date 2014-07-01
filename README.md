cf-fed-wiki - a version of federated wiki for Cloud Foundry
================================================================================

WORK-IN-PROGRESS

The `cf-fed-wiki` package is a version of the
[Federated Wiki node server](https://github.com/fedwiki/wiki-node)
customized for deployment to Cloud Foundry.


installation
================================================================================



usage
================================================================================

    cf-fed-wiki [options]




quick start
================================================================================




hacking
================================================================================

If you want to modify the source to play with it, you'll also want to have the
`jbuild` program installed.

To install `jbuild` on Windows, use the command

    npm -g install jbuild

To install `jbuild` on Mac or Linux, use the command

    sudo npm -g install jbuild

The `jbuild` command runs tasks defined in the `jbuild.coffee` file.  The
task you will most likely use is `watch`, which you can run with the
command:

    jbuild watch

When you run this command, the application will be built from source, the server
started, and tests run.  When you subsequently edit and then save one of the
source files, the application will be re-built, the server re-started, and the
tests re-run.  For ever.  Use Ctrl-C to exit the `jbuild watch` loop.

You can run those build, server, and test tasks separately.  Run `jbuild`
with no arguments to see what tasks are available, along with a short
description of them.



license
================================================================================

All code provided in this package is licensed under:

Apache License, Version 2.0

<http://www.apache.org/licenses/LICENSE-2.0.html>

Packages pulled in via package dependencies are under separate licenses.
