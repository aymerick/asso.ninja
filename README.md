asso.ninja
==========

Asso Ninja website - http://asso.ninja


Development
===========

Setup:

    $ git clone git@github.com:aymerick/asso.ninja.git -b gh-pages `_site`

Install tools:

    $ npm install -g grunt-cli
    $ npm install -g bower
    $ gem install bundle

Install dependencies:

    $ npm install
    $ bower install
    $ bundle install

Build the site and watch for changes:

    $ grunt -v

Browse <http://127.0.0.1:4000>

Deploy to Github Pages:

    $ rake deploy
