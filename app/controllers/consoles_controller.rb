class ConsolesController < ApplicationController
  before_action :set_console, only: [ :show, :edit, :update, :destroy ]

  def index
    @consoles = policy_scope(Console).order(created_at: :desc)
    if params[:query].present?
      @consoles = @consoles.search_by_name(params[:query])
      @console_owners = []
      @consoles.each do |console|
        @console_owners << [console.address, console]
      end
      @markers = @console_owners.map do |owner|
        {
          lat: owner[0][0],
          lng: owner[0][1],
          info_window: render_to_string(partial: "info_window", locals: { console: owner[1] }),
          image_url: helpers.asset_url("marker.png")
        }
      end
      else
        @consoles = policy_scope(Console).order(created_at: :desc)
        @console_owners = []
      @consoles.each do |console|
        @console_owners << [console.address, console]
      end
      @markers = @console_owners.map do |owner|
        {
          lat: owner[0][0],
          lng: owner[0][1],
          info_window: render_to_string(partial: "info_window", locals: { console: owner[1] }),
          image_url: helpers.asset_url("marker")
        }
      end
    end

  end

  def show
    @booking = Booking.new
  end

  def new
    @console = Console.new
    authorize @console
  end

  def create
    @console = Console.new(console_params)
    authorize @console
    @console.user = current_user

    if @console.save
      redirect_to console_path(@console)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @console.update(console_params)
      redirect_to console_path(@console)
    else
      render :edit
    end
  end

  def destroy
    @console.destroy
    redirect_to owned_consoles_path(current_user)
  end

  private

  def console_params
    params.require(:console).permit(:name, :price_per_day, :content, :model, photos: [])
  end

  def set_console
    @console = Console.find(params[:id])
    authorize @console
  end

end
