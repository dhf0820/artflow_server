class Api::V1::ApiController < ActionController::Base
  protect_from_forgery
  before_action :set_mailer_host

  
 private

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  
end