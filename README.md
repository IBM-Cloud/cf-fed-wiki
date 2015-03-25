cf-fed-wiki - a version of federated wiki for Cloud Foundry
================================================================================

The `cf-fed-wiki` package is a version of the
[Federated Wiki server](http://fed.wiki.org/view/welcome-visitors)
customized for deployment to Cloud Foundry.

The best way to learn about Federated Wiki is to visit the
[Federated Wiki video site](http://video.fed.wiki.org/).


deploy on Bluemix
================================================================================

You can deploy this app on the [IBM Bluemix PaaS](https://bluemix.net) by
clicking the "Deploy to Bluemix" button below:

<a target="_blank" href="https://bluemix.net/deploy?repository=https://github.com/IBM-Bluemix/cf-fed-wiki.git">
  <img src="http://bluemix.net/deploy/button.png" alt="Deploy to Bluemix">
</a>
<!-- __ those two underscores are needed to fix atom hilighting - grumble -->


deploy on Cloud Foundry, by hand
================================================================================

* Clone this git repo.

* Customize the `manifest.yml` file to provide your own custom `host` property.

* Create a MongoDB service; the service should be named `mongodb-fedwiki` and
  should have a single property in it's credentials of either `uri` or `url`.
  On Bluemix, you can do this with the command:

        cf create-service mongolab sandbox mongodb-fedwiki

* Push the app without starting it:

        cf push --no-start

* Bind the `mongodb-fedwiki` service to the app (`cf-fed-wiki`):

        cf bind-service cf-fed-wiki mongodb-fedwiki

* Start the app:

        cf start cf-fed-wiki


license
================================================================================

All code provided in this package is licensed under:

Apache License, Version 2.0

<http://www.apache.org/licenses/LICENSE-2.0.html>

Packages pulled in via package dependencies are under separate licenses.
