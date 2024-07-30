class EventsController < ApplicationController
  before_action :authorize_request
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = @current_user.events
    render json: @events, status: :ok
  end

  def show
    render json: @event, status: :ok
  end

  def create
    @event = @current_user.events.build(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event, status: :ok
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    render json: { message: 'Event deleted' }, status: :ok
  end

  private

  def set_event
    @event = @current_user.events.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Event not found' }, status: :not_found
  end

  def event_params
    params.permit(:name, :description, :date, :location)
  end
end
