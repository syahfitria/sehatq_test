class ApplicationController < ActionController::Base
  # before_action :authenticate_user
  skip_before_action :verify_authenticity_token

	def authenticate_user
    # @user = User.where("auth_token = ?", params["auth_token"])
    # if @user.blank?
    #   render :json => {meta:{error_code: 404, messages: "Forbidden Access."}, data: {}}
    # end
  end

end
