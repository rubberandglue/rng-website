Rng-Website
===========

Install
-------

`Gemfile`

    gem 'rng-website', git: 'git://github.com/finchi/rng-website.git'

execute

    rails g rng_website:install
    rake db:migrate

`app/controller/application_controller.rb`

    include RngWebsite::ApplicationController

`app/assets/javascripts/applications.js`

    //= require bootstrap

`app/assets/stylesheets/applications.css`

    *= require bootstrap_import_and_overwrite