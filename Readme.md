# Deploying Joseki APIs on Heroku

This example roughly follows the instructions 
[here](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml).  You can see a deployed instance of it [here](https://joseki-demo.herokuapp.com/).  (This is hosted on Heroku's free tier, it may take a few seconds to respond if no one has used it in a while).  

## Initial setup

You should [install the Heroku CLI]() and then create an app with something like

```shell
heroku apps:create joseki-demo
```

(You probably need to choose a different name for the app since I claimed this one, or leave it blank to automatically generate one.)

The definition of the application is done through the `heroku.yml` file in this folder.  For a
simple API this file can also be very simple -- in this case it's just 

```yaml
build:
    docker:
      web: Dockerfile
```

## Deploying

Running the `heroku apps:create` should have added a new remote to your git repository called `heroku`.  If it didn't you may need to do this manually with `heroku git:remote -a joseki-demo` or similar.  Once the remote is added you can push to the remote with `git push heroku master` to start the build.

You can see details about the app by selecting it from the [Heroku dashboard](https://dashboard.heroku.com/apps), and then click on "Open app" to see it in action.