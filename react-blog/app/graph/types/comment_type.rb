CommentType = GraphQL::ObjectType.define do
name "Comment"
description "Comment"

field :id, types.ID, "The id of the comment"
field :body, types.String, "Body of the comment"
field :created_at, types.String, "Date of creation"
field :votes_count, types.String, "Total number of votes"
field :user, UserType, "User who wrote comment"



end



