require 'test_helper'


class Resolvers::SignInUserTest < ActiveSupport::TestCase
    def perform(args = {})
        Resolvers::SignInUser.new.call(nil, args, {cookies: {}})
    end

    name_value = "MO"
    email_value = "mark@example.com"
    password_value = "password"

    setup do 
        @user = User.create! name: name_value, email: email_value, password : password_value
    end

    test 'create a user login token' do
        result = perform(
            email: @user.email,
            password: @user.password
        )
    
        assert result.present?
        assert result.token.present?
        assert_equal result.user = @user
    
    end

    test 'handling no credentials' do
        assert_nil perform
    
    end

    test 'handling incorrect email' do
        assert_nil perform(email: {email: 'wrong@wrong.com'})
    end

    test 'handling incorrect pssword' do
        assert_nil perform(email: @user.email, password:'wrong password')
    
    end
end
