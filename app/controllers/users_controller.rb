class UsersController < ApplicationController
  def index
    @studio = params[:studio_number]

    @users = if @studio.present?
               # filter by studio
               User.where(studio_number: @studio)
             else
               User.all
             end
  end

  def show
    @user = User.find_by(username: params[:id])
  end

  def new
    # a form for adding a new user
    @user = User.new
  end

  def create
    # take the params from the form
    # create a new user
    @user = User.new(form_params)

    # if its valid and it saves, go to the list users page
    # if not, see the form with errors
    if @user.save
      # save the session with the user
      session[:user_id] = @user.id

      flash[:success] = "Welcome to Uliving Rio's Bulletin Board!"

      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(username: params[:id])

    redirect_to root_path if @user != @current_user
  end

  def update
    flash[:success] = 'Profile updated successfully!' if @current_user.update(profile_form_params)

    redirect_to user_path(@current_user)
  end

  def form_params
    params.require(:user).permit(:username, :email, :phone_number, :studio_number, :password, :password_confirmation)
  end

  def profile_form_params
    params.require(:user).permit(:real_name, :birthday_date, :phone_number, :description, :studio_number, :photo)
  end
end
