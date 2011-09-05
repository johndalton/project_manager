class PeopleController < ApplicationController

  before_filter :authenticate, :only => :show
  respond_to :html, :xml, :json

  def index
    @people = Person.all

    respond_with @people
  end
  
  def show
    @person = Person.find(params[:id])

    respond_with @person
  end

  private
  
  def authenticate
    if params[:id] == "darth-vader"
      redirect_to people_url, :notice => "That page is restricted."
    end
  end

end
