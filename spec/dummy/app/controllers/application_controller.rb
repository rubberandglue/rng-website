class ApplicationController < ActionController::Base
  include RngWebsite::ApplicationController
  protect_from_forgery
end
