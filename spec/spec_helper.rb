require 'pry'

PROJECT_ROOT = File.expand_path('..', __dir__)

Dir[File.join(PROJECT_ROOT, 'app', 'controllers', '*.rb')].each { |f| require f }