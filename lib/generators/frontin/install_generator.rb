require 'rails'

module Frontin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates the frontend directory in the root of your Rails app and installs grunt"

      def create_frontend_directory
        empty_directory "frontend"
      end

      # We could do this easily with a railtie using
      # initializer "frontin.insert_middleware", however this gives the
      # developer the ability to change the Middleware paramaters
      def add_middleware_to_development_env
        application(nil, :env => "development") do
          "config.middleware.use(Frontin::Middleware, :paths => ['/assets', '/app'])"
        end
      end
    end
  end
end
