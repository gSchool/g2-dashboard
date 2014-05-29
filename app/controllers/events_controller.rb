require 'json'


class EventsController < ApplicationController
  def create
    if Project.find_by(:project_api => params[:api_key])
      render json: {}
    else
      render json: {}, status: 500
    end
  end
end
