module Frontin
  class Middleware
    def initialize(app, options={})
      @app = app
      @paths = options[:paths]
      root = options[:root]  || "frontend"
      @file_server = Rack::File.new(root)
    end

    def routable?(path)
      @paths.kind_of?(Array) && @paths.any? { |p| path.index(p) == 0 }
    end

    def call(env)
      path = env["PATH_INFO"]

      if routable?(path)
        @file_server.call(env)
      else
        @app.call(env)
      end
    end
  end
end
