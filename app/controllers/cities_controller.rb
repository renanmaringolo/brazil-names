require 'rest-client'
require 'json'

class CitiesController < ApplicationController
  def show
    api_response = CitiesAPI.get_city(params[:id])
    
    api_response.first['nome']
  end

  def index
    api_response = CitiesAPI.list_cities
    
    list = api_response.each_with_object([]) do |line_json, acc|
      acc << line_json['nome']
    end
  end

  def ranking_general_city
    api_response = CitiesAPI.list_names_city
    
    list = api_response.each_with_object([]) do |line_json, acc|
      acc << line_json['nome']
    end
  end

  def city_by_female
    api_response = CitiesAPI.by_female

    list = api_response.each_with_object([]) do |line_json, acc|
      acc << line_json['nome']
    end
  end

  def city_by_male
    api_response = CitiesAPI.by_male

    list = api_response.each_with_object([]) do |line_json, acc|
      acc << line_json['nome']
    end
  end
end