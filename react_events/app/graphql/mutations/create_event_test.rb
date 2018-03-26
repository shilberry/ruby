require 'test_helper'

class Mutations::CreateEventTest < ActiveSupport::TestCase
    def perform(args {})
        Mutations::CreateEvent.new.call(nil, args, {})
    end

    _testDescription = 'event description'
    _testPlace = 'event place'
    _testDate = 1-2-2018
    _testName = "example name"

    test 'creating new event' do
        event = perform(
            description: _testDescription,
            place: _testPlace,
            date: _testDate,
            name: _testName
        )

    assert event.created?
    assert_equal event.description, _testDescription
    assert_equal event.place, _testPlace
    assert_equal event.date, _testDate
    assert_equal event.name, _testName
    end


end
