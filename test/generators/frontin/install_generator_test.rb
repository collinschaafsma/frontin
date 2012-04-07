require "test_helper"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Frontin::Generators::InstallGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test 'Assert frontend directory is created' do
    run_generator
    assert_directory "frontend"
  end
end
