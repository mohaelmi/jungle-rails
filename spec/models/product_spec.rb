require 'rails_helper'

RSpec.describe Product, type: :model do

    describe 'Validations' do
  
      it 'name field should be exist' do 
        @category = Category.create(name: "Test Category")
        @product = Product.new(name: nil, description: "test product", "price_cents": 2558, "quantity": 5, "category_id": @category.id)
        @product.save
        expect(@product.name).to eq(nil)
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end

      it 'price field should be exist' do 
        @category = Category.create(name: "Test Category")
        @product = Product.new(name: "test_name", description: "test description", "price_cents": nil, "quantity": 5, "category_id": @category.id)
        #@product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end


      it 'quantity field should be exist' do 
        @category = Category.create(name: "Test Category")
        @product = Product.new(name: "test_name", description: "test description", "price_cents": 5241, "quantity": nil, "category_id": @category.id)
        #@product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Quantity can't be blank"
      end

      it 'category field should be exist' do 
        @category = Category.create(name: "Test Category")
        @product = Product.new(name: "test_name", description: "test description", "price_cents": 5241, "quantity": 5, "category_id": nil)
        #@product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Category must exist "
      end
  
    end
  
end
