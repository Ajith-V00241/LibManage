class PagesController < ApplicationController
  def home
  end

  def index 
  	@books = Book.all
  end
  
end
