QueryType = GraphQL::ObjectType.define do
    name "Query"
    description "Query root of the Schema.  See available Queries"


    field :post, PostType do
        argument :id, !types.ID
        description 'Root Object to get viewer related collections'
        resolve -> (ob, args, ctx) {
            Post.find(args["id"])
        }
    end
end
