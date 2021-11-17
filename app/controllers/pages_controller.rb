class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def owned_consoles
    @consoles = policy_scope(Console).where(user: current_user)
  end
end
