Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createEvent, function: Mutations::CreateEvent.new
end
