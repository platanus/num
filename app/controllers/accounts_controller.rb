class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts
  end

  def show
    @account = Account.find_by id: params[:id]
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to account_path(@account), notice: "La cuenta ha sido creada de forma exitosa"
    else
      render :new
    end
  end

  def destroy
  end

  private

  def account_params
    params.require(:account).permit(
      :dni, :number, :account_type_id, :bank_id
    )
    .merge(user: current_user)
  end
end
