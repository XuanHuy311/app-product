FactoryBot.define  do
	factory :product do
		name { Faker::Name.name }
    price { Faker::Number.decimal(l_digits: 5) }
	end
end