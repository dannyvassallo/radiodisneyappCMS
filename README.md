# Radio Disney App CMS

A backend for RD to upload their rules docs... so that I don't have to.

#### Figaro
In the terminal:
```
figaro heroku:set -e production
```

#### New Users
In the browser:
```
https://<<sitename>>/users/8626705366
```

#### Create admin

First sign up as a new user, then do one of the following.

locally:
```ruby
rails c
u = User.last
u.update_attributes(:role => 'admin')
u.save!
```

on heroku:
```ruby
heroku run rails c
u = User.last
u.update_attributes(:role => 'admin')
u.save!
```

#### Embed rules page


```html
<iframe src="//radiodisneyappcms.herokuapp.com" style="border: 0; width: 100%; height: 100%; position: absolute; top: 0; bottom: 0; right: 0; left: 0;"></iframe>
```
