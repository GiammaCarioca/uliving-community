class AccountsController < ApplicationController
  before_action :check_login

  def show
    redirect_to edit_account_path
  end

  def edit
  end

  def update
    if @current_user.update(form_params)
      flash[:success] = "Account updated successfully!"
    end

    redirect_to user_path(@current_user)
  end

  def destroy
    # destroy if they have access
    if @current_user.present? and not @current_user.is_admin?

      # remove the session completely
      reset_session

      @current_user.destroy
    end

    # redirect to the home page
    redirect_to root_path
  end

  def form_params
    params.require(:user).permit(:real_name, :username, :email, :studio_number, :phone_number, :photo, :description, :birthday_date)
  end
end
