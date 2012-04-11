require 'generators/base'

module Frontin
  module Generators
    class InstallGenerator < Frontin::Generators::Base

      desc "Creates the frontend directory in the root of your Rails \n
            app and installs grunt with a sensible config and directory structure."

      def install_grunt_config
        super
      end
    end
  end
end
