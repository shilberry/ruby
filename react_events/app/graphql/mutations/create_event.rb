class Mutations::CreateEvent < GraphQL::Function 
    #arguments
    argument :event_date, !types.String
    argument :description, !types.String
    argument :place, !types.String
    argument :name, !types.String


    type Types::EventType

    def call(_obj, args, _ctx)
       Event.create!(
           event_date: args[:event_date],
           description: args[:description],
           place: args[:place],
           name: args[:name]
       ) 
    end
end
