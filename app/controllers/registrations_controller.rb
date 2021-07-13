class RegistrationsController < ApplicationController

    def registration_params
        params.require(:user).permit(:name, :username, :email, :phone_number, :password, :pass_confirmation)
    end

    def user_update_params
        params.require(:user).permit(:name, :username, :email, :phone_number, :password, :pass_confirmation, :current_password)
    end
end