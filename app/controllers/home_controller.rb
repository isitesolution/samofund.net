class HomeController < ApplicationController
  layout "public"

  def index
    @title = "Samofund Web Application"
  end
end
