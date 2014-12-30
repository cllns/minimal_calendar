class EventsController < ApplicationController
  before_action :authenticate, except: [:index]
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :set_events_by_date, only: :index

  # GET /events
  def index
    # We want a new Event ready for the template
    #  but it only shows if session[:admin]
    if session[:admin]
      # Default start time is 'today' at 7PM
      @event = Event.new( start: Time.zone.parse("7:00 PM"))
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html do
          redirect_to events_url,
                      notice: "'#{@event.title}' was successfully added!"
        end
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH/PUT /events/1
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html do
          redirect_to events_url,
                      notice: "'#{@event.title}' was successfully updated!"
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    respond_to do |format|
      format.html do
        redirect_to events_url,
                    notice: "'#{@event.title}' was successfully deleted."
      end
    end
  end

  # GET /login
  def login
    redirect_to events_url
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :subtitle, :end, :location, :url)
                          .merge( start: start_from_params )
  end

  def start_from_params
    start_params = params.require(:event).permit(:start_time, :start_date)
    # Purposely not using Time.zone here.
    # since we want to take the zone from the param
    Time.parse("#{start_params[:start_date]} #{start_params[:start_time]}")
  end

  def authenticate
    # TODO: check if this first check for session[:admin] is necessary
    #       i feel like the auth... method should take care of it
    #       but adding this conditional fixes our tests
    if !session[:admin]
      authenticate_or_request_with_http_basic do |username, password|
        accounts = Rails.application.secrets.accounts
        if accounts.include? username
          # The user can only be an admin if the password is correct
          # (there could be an issue here if the same username is repeated
          #  but that shouldn't happen...)
          session[:admin] = accounts[username] == password
        end
      end
    end
  end

  # this returns a hash of Date => [events...]
  def set_events_by_date
    @events_by_date = Event.order(:start).
                      where("start > ?", Time.zone.now).
                      group_by { |t| t.start.to_date }
  end
end
