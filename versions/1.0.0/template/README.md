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

    rhc scale-cartridge jbossas-7 -a yourapp 2

Have fun, and drop in to the `#immutant` IRC channel on freenode.net
if you have any questions.
