require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCase
    def perform(args = {})
        Resolvers::CreateLink.new.call(nil,args,{})
    end

    description_value = 'test_description'
    url_value = 'http://testvalue.com'

    test 'creating new link' do
        link = perform(
            url: url_value,
            description: description_value,
        )
    

    assert link.persisted?
    assert_equal link.description, description_value
    assert_equal link.url, url_value
    end

end
