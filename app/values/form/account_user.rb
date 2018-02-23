module Form
  class AccountUser
    include ActiveModel::Model

    attr_accessor :dni, :name, :email, :number, :account_type_id, :bank_id, :username

    def save
      password = SecureRandom.hex(8)
      @username = @username.present? ? @username.downcase : nil

      user = User.create!(
        dni: @dni,
        name: @name,
        email: @email,
        password: password,
        password_confirmation: password,
        username: @username
      )

      user.accounts.create!(
        number: @number,
        account_type_id: @account_type_id,
        bank_id: @bank_id
      )
    end
  end
end
