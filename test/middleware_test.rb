require 'rack/test'
require 'rack/mock'
require 'frontin'

class MiddlewareTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def default_app
    lambda { |env|
      headers = {'Content-Type' => "text/html"}
      [200, headers, ["I'm the default app"]]
    }
  end

  def app
    @app ||= Frontin::Middleware.new(default_app, { :paths => ['/assets'], :root => File.expand_path(File.dirname(__FILE__)) })
  end

  def test_files_in_the_path_are_served
    response = get("/assets/test.js")
    assert_equal response.status, 200
    assert_match /fancy/, response.body
  end

  def test_missing_files_in_the_path
    response = get("/assets/not-here.js")
    assert_equal response.status, 404
  end

  def test_request_without_the_path_falls_out
    response = get("/not-assets/test.js")
    assert_equal response.status, 200
    assert_match /I'm the default app/, response.body
  end
end
