FactoryGirl.define do
  factory :bank_account do
    holder_name 'Usuario de Prueba'
    holder_id '11.111.111-1'
    bank_name 'bbva'
    account_type 'corriente'
  end
end
