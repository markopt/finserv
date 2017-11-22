class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :optimizely_obj, :set_user, :set_pid

  include SessionsHelper
  include HTTParty
  require "optimizely"
  require 'uri'
  
  uri = URI('https://optimizely.s3.amazonaws.com/json/9010861088.json')
  datafile = HTTParty.get(uri).body
  @optimizely_client = Optimizely::Project.new(datafile,Optimizely::EventDispatcher.new,Optimizely::NoOpLogger.new)


  # Optimizely Project ID
  # Replace this with your own Optimizely Full Stack Project ID
  FULLSTACK_PROJECT_ID = '9010861088'
  WEB_PROJECT_ID = '9015821052'


  def update_optimizely
    p 'OPTICON DEMO - Incoming request from Optimizely webhook'
    uri = URI('https://optimizely.s3.amazonaws.com/json/9010861088.json')
    datafile = HTTParty.get(uri).body
    @optimizely_client = Optimizely::Project.new(datafile, Optimizely::EventDispatcher.new, Optimizely::NoOpLogger.new)
    return @optimizely_client
  end
  private
  
  # Method used to determine if Optimizely has been defined yet
  def optimizely_obj
    p 'Checking to see if Optimizely object exists - A16z Event'
    # Checks to see if the optimizely_client variable has been intialized, if not it will run instantiate_optimizely method
    # Commenting this out temporarily
    # @@optimizely_client ||= instantiate_optimizely
    instantiate_optimizely
  end

  # Method used to instantiate the Optimizely client if it hasnt been defined or if it needs to be re-instantiated due to changes
  def instantiate_optimizely
    p 'Instantiating Client!'
    # Here we are accessing the datafile directly in S3 to ensure the most up to date datafile
    # Once the REST API is updated to use the latest (v4) version of the datafile, this will be updated to get the datafile via the API
    uri = URI("https://optimizely.s3.amazonaws.com/json/#{FULLSTACK_PROJECT_ID}.json")
    datafile = HTTParty.get(uri).body
    # Instantiates Class object that is shared across all controllers
    @@optimizely_client = Optimizely::Project.new(datafile, Optimizely::EventDispatcher.new, Optimizely::NoOpLogger.new)

  def set_admin
    @administration = Administration.first
  end

  def set_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def set_pid
    if params[:pid]
      p 'Setting project ID ' + params[:pid] + ' to cookie'
      cookies[:pid] = params[:pid]
      @project_id = params[:pid]
    elsif cookies[:pid]
      p 'Project ID stored in Cookie, using that!'
      @project_id = cookies[:pid]
    else
      p 'Using default snippet'
      @project_id = WEB_PROJECT_ID
    end
  end
end
