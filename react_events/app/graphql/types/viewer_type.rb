ViewerType = GraphQL::ObjectType.define do
    #hack to support root queries

    name 'Viewer'
    description 'support queries and collections'
    interfaces [NodeIdentification.interface]

    global_id_field:id

    connection :posts, PostType.connection_type do
        description 'Post Connection to fetch paginated requests'
        resolve -> (obj, args, ctx) {
            Event.all
        }
    end

end
