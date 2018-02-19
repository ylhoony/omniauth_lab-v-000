class SessionsController < ApplicationController

  def create
    # raise params.inspect
    binding.pry



  end

  private

  def auth
    request.env["omniauth.auth"]
  end

end
