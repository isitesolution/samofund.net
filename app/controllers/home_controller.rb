class HomeController < ApplicationController
  layout "public"

  def index
    @title = "Samofund.Net Web Application"
  end
end
