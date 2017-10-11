class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :optimizely_obj

  include SessionsHelper
  include HTTParty
  require "optimizely"
  require 'uri'

  uri = URI('https://optimizely.s3.amazonaws.com/json/9010861088.json')
  datafile = HTTParty.get(uri).body
  @optimizely_client = Optimizely::Project.new(datafile,Optimizely::EventDispatcher.new,
                                            Optimizely::NoOpLogger.new)
  def optimizely_obj
    if @optimizely_client
      return @optimizely_client
    else
      p 'DEMO - No Optimizely Object, reinstantiating client'
      uri = URI('https://optimizely.s3.amazonaws.com/json/9010861088.json')
      datafile = HTTParty.get(uri).body
      @optimizely_client = Optimizely::Project.new(datafile, Optimizely::EventDispatcher.new, Optimizely::NoOpLogger.new)
      return @optimizely_client
    end
  end

  def update_optimizely
    p 'DEMO - Incoming request from Optimizely webhook'
    uri = URI('https://optimizely.s3.amazonaws.com/json/9010861088.json')
    datafile = HTTParty.get(uri).body
    @optimizely_client = Optimizely::Project.new(datafile, Optimizely::EventDispatcher.new, Optimizely::NoOpLogger.new)
  end
      
end
