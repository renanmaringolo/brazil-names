# frozen_string_literal: true

require 'pry'
require 'simplecov'
SimpleCov.start

PROJECT_ROOT = File.expand_path('..', __dir__)

Dir[File.join(PROJECT_ROOT, 'app', 'services', '*.rb')].sort.each { |f| require f }
Dir[File.join(PROJECT_ROOT, 'app', 'controllers', '*.rb')].sort.each { |f| require f }
