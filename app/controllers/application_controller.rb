# frozen_string_literal: true

# rubocop:disable Style/Documentation

class ApplicationController
  attr_reader :params

  def initialize(params = {})
    @params = params
  end
end
