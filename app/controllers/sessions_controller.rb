class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  protected

  def after_sign_in_path_for(resource)
    dashboard_page_path
  end
end
