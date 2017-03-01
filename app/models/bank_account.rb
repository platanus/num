# == Schema Information
#
# Table name: bank_accounts
#
#  id           :integer          not null, primary key
#  holder_name  :string
#  holder_id    :string
#  bank_name    :string
#  account_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BankAccount < ActiveRecord::Base
  extend Enumerize
  extend ActiveModel::Naming

  validates :holder_name, :holder_id, :bank_name, :account_type, presence: true

  enumerize :bank_name, i18n_scope: 'bank_names', in: [
    :bbva,
    :bci,
    :bice,
    :bancoestado,
    :corpbanca,
    :consorcio,
    :de_chile,
    # :deutsche,
    :falabella,
    :hsbc,
    :paris,
    :itau,
    # :penta,
    :ripley,
    # :rabobank,
    :security,
    :santander,
    :scotiabank,
    :tbanc
  ]

  enumerize :account_type, i18n_scope: 'account_types', in: [
    :corriente,
    :vista,
    :ahorro
  ]
end
