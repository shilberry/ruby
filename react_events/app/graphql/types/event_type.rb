Types::EventType = GraphQL::ObjectType.define do
name 'Event'

   field :id, !types.ID, 'ID of the event'
    field :event_date, !types.String, "Date of the event"
    field :description, !types.String, "Description of the event"
    field :place, !types.String, "Location of the event"
    field :name, !types.String, "Name of the event"
    field :created_at, !types.String, "Created Date"
end
