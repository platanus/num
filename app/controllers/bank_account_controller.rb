class BankAccountController < ApplicationController
  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      redirect_to @bank_account
    else
      render 'create'
    end
  end

  def show


  end

  private

  def bank_account_params
    params.require(:bank_account).permit(
      :holder_name,
      :holder_id,
      :bank_name,
      :account_type,
      :account_number
    )
  end
end
