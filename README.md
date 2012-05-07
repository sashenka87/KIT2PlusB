KIT2PlusB
=========

## Setting up your development/test environment

```
$ bundle install
$ rake db:create # first time only
$ rake db:migrate # only if you updated the database
$ foreman start
$ bundle exec autotest
```

## Deploying on Heroku

Setting up your application
```
$ heroku create --stack cedar
$ git push heroku master
$ heroku run rake db:create
$ heroku run rake db:migrate
```

Updating your application
```
$ git push heroku master
$ heroku run rake db:migrate # only if you updated the database
```

http://drlrl-kit2.herokuapp.com/

## Citation for the 100 mm line
```
http://wiki.biologyscholars.org/@api/deki/files/99/=Schraw1994.pdf
(Schraw & Dennison, 1994)
```