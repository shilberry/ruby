require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
    def perform(args= {})
        Resolvers::CreateUser.new.call(nil, args, nil)
    end

    username_value = 'username_value'
    email_value = 'email_value'
    password_value = 'password_vaue'

    test 'creating new user' do

        user = perform(
            name: username_value,
            authProvider: {
                email: email_value,
                password: password_value
            }
        )

    assert user.persisted?
    assert_equal user.name = username_value
    assert_equal user.email = email_value
    end


end
