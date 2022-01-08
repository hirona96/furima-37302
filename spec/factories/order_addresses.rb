FactoryBot.define do
  factory :order_address do
    token             { 'tok_abcdefghijk00000000000000000' }
    postal_code       { '123-4567' }
    prefecture_id     { 33 }
    city              { '茨城県水戸市' }
    building          { '水戸アパート' }
    address           { '1-1111-111' }
    phone_number      { '09012345678' }
  end
end
