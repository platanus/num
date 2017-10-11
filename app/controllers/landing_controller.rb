class LandingController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'landing'

  def index
  end

  def new
    @resource = Form::AccountUser.new
  end

  def create
    @resource = Form::AccountUser.new(resource_params)
    if @resource.save
      render :success
    else
      render :new, notice: "El formulario presenta errores"
    end
  end

  def show
    @resource = User.find_by(email: "#{params[:email]}.#{params[:format]}")
    raise ActionController::RoutingError.new('Not found') if @resource&.confirmed_at.nil?
    @resource
  end

  def success
  end

  private

  def resource_params
    params.require(:form_account_user).permit(
      :dni, :name, :email, :number, :account_type_id, :bank_id
    )
  end
end
