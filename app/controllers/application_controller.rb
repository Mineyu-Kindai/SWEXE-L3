class ApplicationController < ActionController::Base
  def aaa
    logger.debug "-----Debug Debug Debug Debug Debug Debug-----"
  end
  
  allow_browser versions: :modern
end
