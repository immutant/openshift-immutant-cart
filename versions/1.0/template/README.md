Welcome to Immutant on OpenShift!

The contents of this directory match a standard Leiningen application,
with the exception of the `.openshift/` directory, in which you will
find the following:

- `.openshift/deployments/` contains an Immutant deployment
  descriptor, `your-clojure-application.yml`, that references the root
  of your application when deployed on OpenShift. Anything you set in
  here will be available via `(immutant.registry/get :config)` at
  runtime. The `:lein-profiles` key is how you specify which Leiningen
  profiles are active when deployed on OpenShift.
- `.openshift/action_hooks` are documented
  [here](http://openshift.github.io/documentation/oo_user_guide.html#action-hooks)
- `.openshift/config` contains the JBoss configuration file,
  `standalone.xml`, and any optional JBoss modules your app may
  require.
- `.openshift/markers` contains empty "marker" files which tweak
  certain environment settings, e.g. `hot_deploy` will prevent the app
  server from restarting with each push and `java7` will use JDK 7
  instead of JDK 6.

Any changes you push from this directory will trigger a redeploy of
your app on your OpenShift gear[s].

At this point, you can either write your app from scratch, or you can
merge in changes from an existing project, i.e. your real app. Let's
use a small app demonstrating the various Immutant clustering
features, for example:

    git remote add yourrealapp -m master git@github.com:immutant/cluster-demo.git
    git pull -s recursive -X theirs yourrealapp master
    git push

Now whenever you're ready to deploy your real app to OpenShift, you
pull in changes from your real repo and push to your OpenShift repo.

By the way, to see the clustering features in that demo app, you'll
need to add a gear, like so:

    rhc scale-cartridge immutant -a yourapp 2

Have fun, and drop in to the `#immutant` IRC channel on freenode.net
if you have any questions.
