require 'pathname'
require 'rom'
require 'rom-sql'

SPEC_ROOT = Pathname(__FILE__).dirname
DB_URI = 'sqlite::memory'.freeze

# if RUBY_ENGINE == 'ruby' && ENV['COVERAGE'] == 'true'
#   require 'yaml'
#   rubies = YAML.load(File.read(SPEC_ROOT.join('../../.travis.yml')))['rvm']
#   latest_mri = rubies.select { |v| v =~ /\A\d+\.\d+.\d+\z/ }.max
#
#   if RUBY_VERSION == latest_mri
#     require 'simplecov'
#   end
# end

require 'rom-seed'

begin
  require 'pry'
  require 'pry-byebug'
rescue LoadError
end

LOGGER = Logger.new(File.open('./log/test.log', 'a'))

# require 'dry/core/deprecations'
# Dry::Core::Deprecations.set_logger!(SPEC_ROOT.join('../log/deprecations.log'))

# Namespace holding all objects created during specs
module Test
  def self.remove_constants
    constants.each(&method(:remove_const))
  end
end

warning_api_available = RUBY_VERSION >= '2.4.0'

module SileneceWarnings
  def warn(str)
    if str['/sequel/'] || str['/rspec-core']
      nil
    else
      super
    end
  end
end

# Warning.extend(SileneceWarnings) if warning_api_available

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.warnings = warning_api_available

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after do
    Test.remove_constants
  end

  Dir[SPEC_ROOT.join('support/**/*.rb').to_s].each do |f|
    require f
  end

  Dir[SPEC_ROOT.join('shared/**/*.rb').to_s].each do |f|
    require f
  end
end
