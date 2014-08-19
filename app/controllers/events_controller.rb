class EventsController < ApplicationController
  before_action :authenticate, except: [:index]
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :set_events_by_date, only: :index

  # GET /events
  # GET /events.json
  def index
    # We want a new Event ready for the template
    #  but it only shows if session[:admin]
    #  todo: de-duplicate this?
    if session[:admin]
      @event = Event.new
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash.now[:notice] = "Your item was created"
        format.html { redirect_to events_url, notice: "New event added!" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_url,
                      notice: '"' + @event.title + '" was successfully updated.' }
        # TODO: :show doesn't exist. maybe remove JSON altogether?
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url,
                    notice: '"' + @event.title + '" was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  # GET /login
  def login
    redirect_to events_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :subtitle, :start, :end, :location, :url)
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
      # TODO: do we really want to convert this to a date for the key?
      #       we could probably group by date later?
      @events_by_date = Event.order(:start).where("start > ?", Date.today).group_by do |t|
        t.start.to_date
      end
    end
end