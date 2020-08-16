class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :json

  def google_oauth2
    resource = User.from_omniauth(request.env['omniauth.auth'])

    sign_in(resource_name, resource)
    
    render json: resource
  end
end