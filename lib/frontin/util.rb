module Frontin
  module Util
    def run_command(cmd)
      output = nil
      IO.popen(cmd) { |f| output = f.read }
      output
    end

    def binary_installed?(binary)
      if File.executable? binary
        true
      else
        # Look through their $PATH env variable to see if we can find it
        path = ENV['PATH'].split(File::PATH_SEPARATOR).find do |p|
          full_path = File.join(p, binary)
          File.executable?(full_path) && File.file?(full_path)
        end
        path && File.expand_path(binary, path)
      end
    end

    def directory_trees
      %w(frontend frontend/app frontend/assets frontend/assets/css
           frontend/assets/js frontend/assets/js/libs frontend/test
           public/assets public/assets/js/debug public/assets/js/release
           public/assets/js/libs public/assets/css/release public/assets/img)
    end
  end
end
