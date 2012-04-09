module Frontin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates the frontend directory in the root of your Rails app and installs grunt"

      def create_frontend_directory
        empty_directory "frontend"
      end
    end
  end
end
