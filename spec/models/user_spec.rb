require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validation' do

    it "user must be created with a password_confirmation fields" do 
      @user = User.create(first_name: 'test_first', last_name: 'test_last', email: 'test@gmail.com', password: "12345678")
      expect(@user.password_digest).to_not be_nil
    end
    
    it "Emails must be unique" do 
      @user1 = User.create(first_name: 'test_first1', last_name: 'test_last1', email: 'test@gmail.com', password: "12345678")
      @user2 = User.create(first_name: 'test_first2', last_name: 'test_last2', email: 'test@gmail.com', password: "12345678")
      @user1.save
      @user2.save
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it 'Email should be required' do 
      @user = User.create(first_name: 'test_first', last_name: 'test_last', email: nil, password: "12345678")
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'first name should be required' do 
      @user = User.create(first_name: nil, last_name: 'last_name', email: 'test@gmail.com', password: "12345678")
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'last name should be required' do 
      @user = User.create(first_name: 'first_name', last_name: nil, email: 'test@gmail.com', password: "12345678")
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'The password must have a minimum length when a user account is being created.' do 
      @user = User.create(first_name: 'first_name', last_name: 'last_name', email: 'test@gmail.com', password: "123")
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 8 characters)"
    end

    
  end


  describe '.authenticate_with_credentials' do
    it 'allows user if the email and password are correct' do
      @user = User.new(first_name: 'John', last_name: 'Yousef', email: 'yjohn@gmail.com', password: "123456789")
      @user.save
      user_authenticated = User.authenticate_with_credentials('yjohn@gmail.com', '123456789')
      expect(user_authenticated).to_not be_nil
    end

    it "authenticates if the user write email with spaces" do 
      @user = User.new(first_name: 'John', last_name: 'amed', email: 'test@gmail.com', password: "123456789")
      @user.save
      user_authenticated = User.authenticate_with_credentials(' test@gmail.com ', '123456789')
      expect(user_authenticated).to_not be_nil
    end

    it "authenticates email without case sensitive" do 
      @user = User.new(first_name: 'John', last_name: 'amed', email: 'eXample@domain.COM', password: "123456789")
      @user.save
      # byebug
      user_authenticated = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', '123456789')
      expect(user_authenticated).to_not be_nil
    end

  end


end
