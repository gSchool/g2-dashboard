require 'kaminari'

class EventsController < ApplicationController
  def show
    event =
      [{
         "occurred_on" => 89765467,
       }]
    @events = []
    100.times do
      @events << event
    end
    @events.page params[:page]
  end
end