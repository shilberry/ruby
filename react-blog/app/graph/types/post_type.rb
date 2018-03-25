PostType = GraphQL::ObjectType.define do
    name "Post"

    description "A single post entry returns a post with author, total votes and comments"

    field :id, types.ID, "The id of the post"
    field :title, types.String, "The title of thepost"
    field :body, types.String, "The body of the post"
    field :slug, types.String, "the slug of the post"
    field :comments_count, types.String, " total number of comments of the post"
    field :votes_count, types.String, "total number of votes"
    field :created_at, types.String, "Create date"
    field :user, UserType, "owner of the post"
end
