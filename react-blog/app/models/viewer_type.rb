ViewerType = GraphQL::ObjectType.define do

    #hack to support root queries

    name 'Viewer'
    description 'support root queries'

    interfaces [NodeIdentification.interface]

    # `id` expostes UUID
    global_id_field:id

    #fetch all posts

    connection :posts, PostType.connection_type do
        description 'Post connection to fetch paginated posts collection'

        resolve -> (object, args, ctx) {
            Post.includes(:user)
        }
    end

end