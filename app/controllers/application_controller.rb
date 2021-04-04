class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_locale

  def set_locale
    I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end
end
