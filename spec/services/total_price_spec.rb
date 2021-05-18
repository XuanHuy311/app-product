require 'rails_helper'

RSpec.describe TotalPrice do
	let(:product_1) { create(:product, name:'Chocolate', price: 100) }
	let(:product_2) { create(:product, name: 'book', price: 1000) }
	let(:product_3) {create(:product, name: 'imported book', price: 1500)}
	
	describe '#total' do
		let(:total) { 1*product_1.price + 1*product_2.price + 1*product_3.price + 0.1*product_3.price } 
		
		specify do
			expect(total).to eq 2750
		end
	end
end