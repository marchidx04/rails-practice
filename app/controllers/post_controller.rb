class PostController < ApplicationController

  @@timestamp = current_timestamp
  @@service_id = 
  @@access_key = 

  def index
    p current_timestamp
    p Time.now
  end

  def new
  end

  def create
  end

  def show
  end

  private

  def signature
    sms_uri = "/sms/v2/services/#{@@service_id}/message".freeze
    data = "POST #{sms_uri}\n#{@@current_timestamp}\n#{@@access_key}".freeze
  end

  def current_timestamp
    (Time.now.to_f.round(3) * 1000).to_i
  end
end
