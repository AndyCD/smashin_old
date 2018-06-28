class MainController < ApplicationController
  def home
    @current_page = 'homepage'
  end

  def about
    @current_page = 'aboutpage'
  end
end
