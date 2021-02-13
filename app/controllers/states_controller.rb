require 'rest-client'
require 'json'

class StatesController < ApplicationController
  def show
    api_response = StatesAPI.get_state(params[:id])

    body = "<h1>#{api_response['sigla']}</h1>"

    { body: body, status: 200 }
  end
end