Immutant OpenShift Cartridge
============================

To install Immutant 1.0 on OpenShift, first make sure you have the
latest [client tools](https://www.openshift.com/get-started#cli)
installed, and then run this:

    rhc app-create -s yourapp https://raw.github.com/immutant/openshift-immutant-cart/master/metadata/manifest.yml 

Replace `yourapp` with the name of your application. The `-s` option
sets your app to be scalable. Once created, you can login to your gear
like so:

    rhc ssh yourapp

At which point, you can monitor your Immutant like so:

    tail -f immutant/logs/server.log

Alternatively, you can tail the log without first logging in:

    rhc tail yourapp -f immutant/logs/server.log

When you see `Deployed "your-clojure-application.clj"` in the log,
point a browser at the following link (adjusted for your namespace)
and you should see a friendly welcome:

    http://yourapp-$namespace.rhcloud.com

You can connect to your app via any nREPL client at `localhost:27888`
after running this command:

    rhc port-forward -a yourapp

Your nREPL service is secured by your ssh private key. Only those
people whose public ssh keys you associate with your app may access
it. 

Any changes you push from the `yourapp/` directory will trigger a
redeploy of your app. At this point, you can either write your app
from scratch, or you can merge in changes from an existing project,
i.e. your real app. Let's use a small app demonstrating the various
Immutant clustering features, for example:

    git remote add yourrealapp -m master git@github.com:immutant/cluster-demo.git
    git pull -s recursive -X theirs yourrealapp master
    git push

Now whenever you're ready to deploy your real app to OpenShift, you
pull in changes from your real repo and push to your OpenShift repo.

By the way, to see the clustering features in that demo app, you'll
need to add a gear, like so:

    rhc scale-cartridge immutant -a yourapp 2

Have fun, and drop in to the `#immutant` or `#openshift` IRC channels
on freenode.net if you have any questions.
