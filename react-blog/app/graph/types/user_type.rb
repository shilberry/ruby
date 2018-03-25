UserType = GraphQL::ObjectType.define do
    name "User"
    description "A user entry"


    field :id, types.Id, "Id of the user"
    field :name, types.String, "Name of user"
    field :email, types.String, "Email of the user"
    field :created_at, types.String, "Created date"
end
