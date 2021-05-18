require 'rails_helper'

RSpec.describe Product, type: :model do
	describe '.validates' do
		let (:product) { create(:product) }

		specify do
			expect(product).to validate_presence_of(:name)
			expect(product).to validate_numericality_of(:price)
		end
	end
end
