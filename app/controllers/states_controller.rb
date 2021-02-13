require 'rest-client'
require 'json'

class StatesController < ApplicationController
  def show
    api_response = StatesAPI.get_state(params[:id])

    body = "<h1>#{api_response['nome']}</h1>"

    { body: body, status: 200 }
  end

  def index
    api_response = StatesAPI.list_states

    list_html = api_response.each_with_object("") do |json_row, acc|
      acc << "<li>#{json_row['nome']}</li>"
    end

    body = "<ul>#{list_html}</ul>"

    { body: body, status: 200 }
  end
end