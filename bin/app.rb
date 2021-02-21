#!/usr/bin/env ruby
# frozen_string_literal: true

PROJECT_ROOT = File.expand_path('..', __dir__)

Dir[File.join(PROJECT_ROOT, 'bin', 'ux.rb')].sort.each { |f| require f }
Dir[File.join(PROJECT_ROOT, 'app', 'services', '*.rb')].sort.each { |f| require f }
Dir[File.join(PROJECT_ROOT, 'app', 'controllers', '*.rb')].sort.each { |f| require f }

CitiesAPI.configure_type_request(:api)
StatesAPI.configure_type_request(:api)

loop do
  menu
  break if not_consult?
end

puts see_you
