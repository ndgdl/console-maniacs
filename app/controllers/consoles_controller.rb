class ConsolesController < ApplicationController
  def index
    @consoles = Console.all
  end

  def show
    @console = Console.find(params[:id])
  end
end
