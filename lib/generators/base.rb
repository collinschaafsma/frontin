require 'rails'
require 'frontin/util'

module Frontin
  module Generators
    class Base < Rails::Generators::Base
      include Frontin::Util

      def build_directories
        say("Setting up a sensible directory structure in frontend/ and public/ to work with grunt config")

        directory_trees.each do |path|
          empty_directory path
        end
      end

      # We could do this easily with a railtie using
      # initializer "frontin.insert_middleware", however this gives the
      # developer the ability to change the Middleware paramaters
      def add_middleware_to_development_env
        application(nil, :env => "development") do
          "config.middleware.use(Frontin::Middleware, :paths => ['/assets', '/app'], :root => 'frontend')"
        end
      end

      def install_grunt
        if binary_installed?('npm')
          if binary_installed?('grunt')
            say("grunt detected on your system")
          else
            say("Invoking: npm install -g grunt")
            run_command('npm install -g grunt')
          end
        else
          say("We couldn't find npm on your system. Skipping grunt install.")
          say("Install npm with: curl http://npmjs.org/install.sh | sh")
        end
      end

      private
      def install_grunt_config
        say("Installing sensible grunt configuration for your environment in frontend/ directory.")
        get "https://raw.github.com/gist/2348189/3aa8f76e2f2d2aa47a803314b14c99396baf0321/rails-grunt.js", "frontend/grunt.js"
      end
    end
  end
end
