class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    if event_params[:start].to_time < Time.now - (3 * 60 * 60)
      render json: @events.errors, status: :unprocessable_entity
    else
      @event = Event.new(event_params)
      @event.save
    end
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end
  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:description, :start, :end, :color, :user_id)
    end
end
  