# frozen_string_literal: true

# rubocop:disable Style/Documentation

require 'rest-client'
require 'json'

class StatesController < ApplicationController
  def show
    api_response = StatesAPI.get_state(params[:id])

    api_response['sigla']
  end

  def index
    api_response = StatesAPI.list_states

    api_response.each_with_object([]) do |line_json, acc|
      acc << line_json['sigla']
    end
  end

  def ranking_general_state
    api_response = StatesAPI.list_names_state

    api_response.each_with_object([]) do |line_json, acc|
      acc << line_json['nome']
    end
  end

  def state_by_female
    api_response = StatesAPI.by_female

    api_response.each_with_object([]) do |line_json, acc|
      acc << line_json['nome']
    end
  end

  def state_by_male
    api_response = StatesAPI.by_male

    api_response.each_with_object([]) do |line_json, acc|
      acc << line_json['nome']
    end
  end
end
