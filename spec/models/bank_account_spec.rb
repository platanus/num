require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  context 'when created/updated' do
    let(:bank_account) { build(:bank_account) }

    it 'fails validation with no holder_name' do
      bank_account.holder_name = nil
      expect(bank_account.valid?).to be_falsey
      expect(bank_account.errors[:holder_name].size).to eq(1)
    end

    it 'fails validation with no holder_id' do
      bank_account.holder_id = nil
      expect(bank_account.valid?).to be_falsey
      expect(bank_account.errors[:holder_id].size).to eq(1)
    end

    it 'fails validation with no bank_name' do
      bank_account.bank_name = nil
      expect(bank_account.valid?).to be_falsey
      expect(bank_account.errors[:bank_name].size).to eq(1)
    end

    it 'fails validation with no account_type' do
      bank_account.account_type = nil
      expect(bank_account.valid?).to be_falsey
      expect(bank_account.errors[:account_type].size).to eq(1)
    end
  end
end
