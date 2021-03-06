require 'pty'
require 'expect'
require 'generators/base'

module Frontin
  module Generators
    class BbbGenerator < Frontin::Generators::Base

      desc "Creates the frontend directory in the root of your Rails \n
            app and installs grunt with the bbb plugin and a sensible config and directory structure."

      def install_bbb
        if binary_installed?('npm')
          if binary_installed?('bbb')
            say("bbb detected on your system")
          else
            say("Invoking: npm install -g bbb")
            run_command('npm install -g bbb')
          end
        else
          say("We couldn't find npm on your system. Skipping bbb install.")
          say("Install npm with: curl http://npmjs.org/install.sh | sh")
        end
      end

      def bbb_init
        if binary_installed?('bbb')
          say("Invoking: bbb init")
          # Make sure this can run in test mode
          bbb_namespace = Rails.env.test? ? 'myapp' : ask("Backbone project namespace?")
          cmd = Rails.env.test? ? "cd test/generators/tmp/frontend; bbb init" : 'cd frontend; bbb init'

          STDOUT.sync     = true
          STDERR.sync     = true
          $expect_verbose = false
          PTY.spawn(cmd) do |output,input,pid|
            input.sync = true
            output.expect(/Project namespace/) { input.puts bbb_namespace }
            output.expect(/Do you need to make any changes to the above before continuing/) { input.puts "N" }
          end
        end
      end

      def install_grunt_config
        super
      end
    end
  end
end
