class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  skip_before_action :verify_authenticity_token

end
