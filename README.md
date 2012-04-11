# Frontin

Give your frontend code some respect in Rails. Don't even front.

Frontin adds middleware to allow you to develop your frontend code in `Rails/root/frontend` and serve it in development mode.
Frontin takes any request for `assets/**js, assets/**css` or `app/**js` and maps those requests to `Rails/root/frontend` in development mode.
It also provides generators to easily setup the backbone-boilerplate using grunt so that you can easily build to `public/assets/` for production. Keeping your frontend source out of `public/`.

**Frontin is NOT designed to work with the asset pipeline.**
If that sounds pretty awesome to you, and you don't want your frontend code to get all mixed up in the Rails framework then frontin might be the kitties pj's for you.

Learn more about grunt https://github.com/cowboy/grunt, and the backbone-boilerplate https://github.com/backbone-boilerplate/grunt-bbb

[![Build Status](https://secure.travis-ci.org/collinschaafsma/frontin.png)](http://travis-ci.org/collinschaafsma/frontin)

## Why

Frontin was developed out of frustration with the asset pipeline. Instead it uses grunt to compile frontend code to the `public/` directory where a web server like
nginx can make quick work out of it. Grunt gives you all the controll in the world over building your frontend code.  We feel it's the right tool for the job and prefer to
use the Rails framework for what it's best at.


## Installation

Add this line to your application's Gemfile:

    gem 'frontin', :group => :development

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install frontin

## Usage

Frontin provides several generators to make life easy.

    rails g frontin:install

This adds the `frontend/` directory to the root of your Rails project where you can start writing your frontend code.
In addition the node npm package grunt will be installed for building your assets with a sensible config.

Frontin also makes it easy to install the backbone-boilerplate into your `frontend` directory using
the node npm package bbb. If your looking to build your frontend using Backbone we highly suggest you give the backbone-boilerplate a spin.

    rails g frontin:bbb

## Disabling the asset pipeline

It's highly recommended that if you use frontin to disable the asset pipeline to avoid
any conflicts. Besides, at this point you don't need it anymore.

### Greenfield project

    rails new my_project -S

### Existing project

    config/application.rb

    # comment out
    require "sprockets/railtie"

    # disable the asset pipeline
    config.assets.enabled = false

    # optionally disable the generators
    config.generators.stylesheets = false
    config.generators.javascripts = false

## Example Rails app

https://github.com/collinschaafsma/frontin_rails_example

## Thanks

* cowboy (Ben Alman) for writing grunt. https://github.com/cowboy/grunt
* tbranyen (Tim Branyen) for writing backbone-boilerplate. https://github.com/backbone-boilerplate/grunt-bbb
* wookiehangover (Sam Breed) and nicovalencia (Nico Valencia) for their inspiration and smarts
* All the other contributers to the projects that make frontin possible

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
