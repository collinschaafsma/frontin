require 'test_helper'
require 'rails/generators/test_case'
require 'generators/frontin/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  include Frontin::Util

  tests Frontin::Generators::InstallGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup do
    prepare_destination
    stage_development_env
  end

  def stage_development_env
    FileUtils.mkdir_p File.dirname(development_env)
    File.open(development_env, 'w') {|f| f.write("FrontinTest::Application.configure do\n\nend") }
  end

  def development_env
    @development_env ||= File.expand_path("config/environments/development.rb", destination_root)
  end

  test 'Install Generator' do
    run_generator
    directory_trees.each do |path|
      assert_directory path
    end

    assert_file 'frontend/grunt.js'

    contents = File.read(development_env)
    assert_match(/config.middleware.use\(Frontin::Middleware, :paths => \['\/assets', '\/app'\], :root => 'frontend'\)/m, contents)
  end
end
