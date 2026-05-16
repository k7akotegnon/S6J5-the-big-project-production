class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  
  # This is a helper method defined in app/helpers/sessions_helper.rb that we want to be available in all our views and controllers.  By including SessionsHelper in ApplicationController, we ensure that all controllers and views can access the methods defined in SessionsHelper, such as current_user, logged_in?, etc., which are essential for managing user sessions and authentication throughout the application.
  include SessionsHelper
end
