** JUST GETTING STARTED. WIP. NOT COMPLETE CODE. README DRIVEN DEVELOPMENT.**

# Frontin

Give your frontend code some respect in Rails. Don't even front.

Frontin adds middleware to allow you to develop your frontend code in `Rails/root/frontend` and serve it in development mode.
Frontin takes any request for `assets/**js, assets/**css` or `app/**js` and maps those requests to `Rails/root/frontend`.
It also provides generators to easily setup the backbone-boilerplate using grunt so that you can easily build to `public/assets/` for production. Keeping your frontend source out of `public/`.

**Frontin is NOT designed to work with the asset pipeline, it actually disables it completely.**
If that sounds pretty awesome to you, and you don't want your frontend code to get all mixed up in the Rails framework then frontin might be the kitties pj's for you.

Learn more about grunt https://github.com/cowboy/grunt, and the backbone-boilerplate https://github.com/backbone-boilerplate/grunt-bbb

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
**It will completly disable the asset pipeline in Rails!**
In addition the node npm package grunt will be installed for building your assets with a sensible config.
To view the details of this generator you can view the source here.

Frontin also makes it easy to install the backbone-boilerplate into your `frontend` directory using
the node npm package bbb. If your looking to build your frontend using Backbone we highly suggest you give the backbone-boilerplate a spin.
To view the details of this generator you can view the source here.

    rails g frontin:bbb

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
