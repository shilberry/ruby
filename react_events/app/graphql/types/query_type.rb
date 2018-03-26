Types::QueryType = GraphQL::ObjectType.define do
    name 'Query'
    description 'Base Query'

    field :node, field: NodeIdentification.field

    field :root, ViewerType do
        description 'Root object to get collections'
        resolve -> (obj, args, ctx) {Viewer::STATIC}
    end

    field :allEvents, !types[Types::EventType] do
        resolve -> (obj, args, ctx) { Event.all }
    end

end
