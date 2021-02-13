require 'pry'

PROJECT_ROOT = File.expand_path('..', __dir__)

Dir[File.join(PROJECT_ROOT, 'app', 'services', '*.rb')].each { |f| require f }
Dir[File.join(PROJECT_ROOT, 'app', 'controllers', '*.rb')].each { |f| require f }

StatesAPI.configure_driver(:file)