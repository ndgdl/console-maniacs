class ConsolesController < ApplicationController
  def index
    @consoles = Console.all
  end

  def show
    @console = Console.find(params[:id])
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

  private

  def console_params
    params.require(:console).permit(:name, :price_per_day, :content, :model, photos: [])
  end
end
