#Radio Disney App CMS

A backend for RD to upload their rules docs... so that I don't have to.

####Figaro
In the terminal:
```
figaro heroku:set -e production
```

####New Users
In the browser:
```
https://<<sitename>>/users/8626705366
```

####Create admin

First sign up as a new user, then do one of the following.

locally:
```
rails c
u = User.last
u.update_attributes(:role => 'admin')
u.save!
```

on heroku:
```
heroku run rails c
u = User.last
u.update_attributes(:role => 'admin')
u.save!
```
