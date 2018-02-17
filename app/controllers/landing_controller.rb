class LandingController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'landing'

  def index; end

  def new
    @resource = Form::AccountUser.new
  end

  def create
    @resource = Form::AccountUser.new(resource_params)
    if @resource.save
      render :success
    else
      render :new, notice: 'El formulario presenta errores'
    end
  end

  def show
    is_email = Devise.email_regexp =~ params[:user_ref]
    if is_email
      @resource = User.find_by(email: params[:user_ref])
    else
      @resource = User.find_by(username: params[:user_ref])
    end
    raise ActionController::RoutingError, 'Not found' if @resource&.confirmed_at.nil?

    @acc = @resource.accounts.first
    @full_acc_details = full_acc_details(@resource, @acc)
  end

  def success; end

  private

  def resource_params
    params.require(:form_account_user).permit(
      :dni, :name, :email, :number, :account_type_id, :bank_id
    )
  end

  def full_acc_details(user, acc)
    "#{user.name}
#{user.dni}
#{acc.bank.name}
#{acc.account_type.name}
#{acc.number}
#{user.email}"
  end
end
