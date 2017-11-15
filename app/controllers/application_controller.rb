class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :optimizely_obj, :set_user

  include SessionsHelper
  include HTTParty
  # Optimizely SDK
  require "optimizely"
  require 'uri'

  # Optimizely Project ID
  # Replace this with your own Optimizely Full Stack Project ID
  PROJECT_ID = '9010861088'

  # Method to handle incoming POST requests from Optimizelys webhook service
  # When a request is made indicating a change to the datafil we will re-instantiate the Optimizely client
  # This ensure that the Optimizely client will always be up to sync with changes made in the Optimizely interface
  def update_optimizely
    p 'Incoming webhook from Optimizely, instantiating client'
    instantiate_optimizely
    head :no_content
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
    uri = URI("https://optimizely.s3.amazonaws.com/json/#{PROJECT_ID}.json")
    datafile = HTTParty.get(uri).body
    # Instantiates Class object that is shared across all controllers
    @@optimizely_client = Optimizely::Project.new(datafile, Optimizely::EventDispatcher.new, Optimizely::NoOpLogger.new)
  end

  def set_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
  
end
