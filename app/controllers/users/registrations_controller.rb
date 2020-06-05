# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    # binding.pry
    # @user = User.new(configure_sign_up_params)
    build_resource(sign_up_params)  
    # binding.pry
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end

    session['devise.regist_data'] = {user: @user.attributes}
    session['devise.regist_data'][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def new_address
    # binding.pry
  end

  def create_address
    @user = User.new(session['devise.regist_data']["user"])
    @address = Address.new(address_params)
    # binding.pry
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    sign_in(:user, @user)
    redirect_to controller: "/complete_pages", action: "index"
  end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :birthday, :first_name, :last_name, :first_name_kana, :last_name_kana])
    # binding.pry
  end

  def address_params
    # binding.pry
    params.require(:address).permit(:post_number, :prefecture_id, :city, :town, :building, :phone_number)
    # binding.pry
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
