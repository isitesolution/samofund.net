class HomeController < ApplicationController
  layout "public"

  def index
    @title = "Welcome to Samofund"
  end
end