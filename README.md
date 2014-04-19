## Authors

- Taylor Lapeyre
- Selby Kendrick
- Holly Lions

## Features

**[Initial Application Spec][spec]**

- ~~Initial design work~~
- ~~Custom user sign up~~
- ~~Signing in~~
- ~~Sign in with GitHub~~
- ~~User "profile" pages~~
- ~~Basic Language functionality~~
- ~~Basic Snippet functionality~~
- ~~Private snippets~~
- ~~Commenting on snippets~~
- "Smart" default front page
- ~~Pagination~~
- ~~Notifications (just comments)~~
- ~~Awesome Editor~~
- ~~Email~~
- Snippet tagging
- Search (Probably not full text, just tags)
- Public API
- Editor integration

## The Things

#### The Language

**[Ruby][ruby]** - a dynamic scripting language with a focus on simplicity


#### The Framework

**[Rails][rails]** - a popular MVC web framework built on ruby

#### The Database

**[PostgreSQL][postgre]** - a fast, secure, and modern relational database


#### The Server

**[Heroku][heroku]** - a free-to-use cloud application platform focusing on hosting web applications


#### The Version Control System

**[Git][git]** - a very popular distributed version control system

**[GitHub][github]** - a git repository hosting service


## Getting Started

### Dependencies

- Ruby (>= 2.0)

```bash
$ ruby -v
ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin13.0]
```

- Rails (4.0.4)

```bash
$ gem install rails
...
$ rails --version
Rails 4.0.4
```

- PostgreSQL

```bash
$ brew install postgres
```

### Running the App

1. Open a terminal and change to the repository directory

``` bash
$ cd path/to/agora
```

2. Start up your database

```bash
$ postgres -D /usr/local/var/postgres
```

3. Make sure that all required packages are installed

``` bash
$ bundle install
```

4. Make sure that all database migrations have been run

``` bash
$ bundle exec rake db:migrate
```

5. Put some seed data in your development database

``` bash
$ bundle exec rake db:seed
```

6. Start up the rails server

```
$ rails server
```

## Other Useful Things

- [Sublime Text][subl] - a popular text editor
- [Screenhero][screenhero] - screen sharing made for remote developers
- [IRC][irc] - We can use the IRC channel *#lsucompsci* on freenode to talk about the project


[ruby]: https://www.ruby-lang.org/en/
[rails]: http://guides.rubyonrails.org/getting_started.html
[heroku]: https://www.heroku.com/
[git]: http://gitref.org/
[subl]: http://www.sublimetext.com/
[screenhero]: http://screenhero.com/
[github]: https://github.com/
[postgre]: http://www.postgresql.org/
[irc]: http://webchat.freenode.net/?channels=lsucompsci
[spec]: https://docs.google.com/document/d/13zR1kAtHhCP0CI6najiTOtRcOdG9E93Je5OW2Vu1K_s/edit?usp=sharing
