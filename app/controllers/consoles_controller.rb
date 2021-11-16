class ConsolesController < ApplicationController
  before_action :set_console, only: [ :show, :edit, :update, :destroy ]

  def index
    @consoles = Console.all
  end

  def show
  end

  def new
    @console = Console.new
  end

  def create
    @console = Console.new(console_params)
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
    redirect_to consoles_path
  end

  private

  def console_params
    params.require(:console).permit(:name, :price_per_day, :content, :model, photos: [])
  end

  def set_console
    @console = Console.find(params[:id])
  end

end
