module Frontin
  class Railtie < Rails::Railtie
    initializer "frontin.insert_middleware" do |app|
      app.config.middleware.insert_after(::ActionDispatch::Static,
        ::Rack::Static, :urls => ["/assets", "/app"], :root => 'frontend')
    end
  end
end
