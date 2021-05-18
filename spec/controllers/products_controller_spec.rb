require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	let(:product_1) { create(:product) }
	let(:product_2) { create(:product) }

	describe "GET #index" do
		specify do
			get :index
			expect(response).to be_successfull
			expect(assigns(:products)).to eq([product_1, product_2])
			expect(response).to render_template :index 
		end
	end

	describe "GET #new" do
		specify do
			get :new
			expect(response).to be_successfull
			expect(response).to render_template :new
		end
	end

	describe "GET #show" do
		specify do
			get :show, params: { id: product_1 }
			expect(assigns(:product)).to eq(product_1)
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		specify do
			get :edit, params: { id: product_1 }
			expect(assigns(:product)).to eq(product_1)
			expect(response).to render_template :edit
		end
	end

	describe "POST #create" do
		let(:params) do
			{
				product: 
				{
					name: 'chocolate',
					price: price
				}
			}
		end

		context "success" do
			let(:price) { 30_000 }

			specify do
				expect do
					post :create, params: params
				end.to change(Product, :count).by(1)
				product = Product.last
				expect(product).to have_attribute(name:'chocolate', price: 30_000)
				expect(response).to re_direct products_path
				expect(flash[:success]).to eq 'create successful'
			end
		end

		context "failure" do
			let(:price) {'ba chuc'}

			specify do
				expect do
					post :create, params: params
				end.to_not change { Product.count }
				expect(response).to render_template :new
				expect(flash[:error]).to eq 'can not create'
			end
		end
 	end

 	describe "PUT #update" do
 		let(:params) do
 			{
 				id: product_1.to_param,
 				product:
 				{
 					name: 'chocolate',
 					price: price
 				}
 			}
 		end

 		context "success" do
 			let(:price) { 40_000 }

 			specify do
 				put :update, params: params
 				product = product_1.reload
 				expect(product).to have_attribute(name: 'chocolate', price: 40_000)
 				expect(response).to re_direct products_path
 				expect(flash[:success]).to eq 'Update successful'
 			end
 		end

 		context "failure" do
 			let(:price) {'ba chuc'}

 			specify do
 				expect do
 					put :update, params: params
 				end.to_not change{ product_1 }
 				expect(response).to render_template :edit
 				expect(flash[:error]).to eq 'Can not update'
 			end
 		end
 	end

 	describe "DELETE #destroy" do
 		context 'success' do
 			specify do
 				expect do
 					delete :destroy, params: { id: product_1.to_param }
 				end.to change(Product, :count).by(-1)
 				expect(response).to re_direct products_path
 				expect(flash[:success]).to eq 'Delete successful'
 			end
 		end

 		context 'failure' do
 			specify do
 				expect do
 					delete :destroy, params: { id: product_1.to_param }
 				end.to change(Product, :count).by(0)
 				expect(flash[:error]).to eq 'Can not delete'
 			end
 		end
 	end
end
