class Users::RegistrationsController < Devise::RegistrationsController
  # Override the action you want here.
  protected

  def after_sign_up_path_for(resource)
    '/courses' # Or :prefix_to_your_route
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def sign_up_params
    params.require(:user).permit(:name, :email, :DOB, :gender, :image, :password, :password_confirmation)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  
end