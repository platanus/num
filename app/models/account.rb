class Account < ApplicationRecord
  belongs_to :account_type
  belongs_to :bank
  belongs_to :user
end

# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  dni             :string
#  number          :string
#  account_type_id :integer
#  bank_id         :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_accounts_on_account_type_id  (account_type_id)
#  index_accounts_on_bank_id          (bank_id)
#  index_accounts_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_type_id => account_types.id)
#  fk_rails_...  (bank_id => banks.id)
#  fk_rails_...  (user_id => users.id)
#
