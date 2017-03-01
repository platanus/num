require 'rails_helper'

RSpec.describe Handle, type: :model do
  let(:handle) { build(:handle) }
  let(:handle2) { build(:handle) }

  describe 'associations' do
    it { is_expected.to belong_to(:bank_account) }
  end

  context 'when created/updated' do
    it 'fails validation with no handle' do
      handle.handle = nil
      expect(handle.valid?).to be_falsey
      expect(handle.errors[:handle].size).to eq(1)
    end

    it 'fails validation with no bank_account' do
      handle.bank_account = nil
      expect(handle.valid?).to be_falsey
      expect(handle.errors[:bank_account].size).to eq(1)
    end

    it 'fails to create a registered handle' do
      expect(handle2.valid?).to be_falsey
    end
  end
end
