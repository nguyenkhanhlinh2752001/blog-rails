class CommentSerializer < ActiveModel::Serializer
    attributes :id, :commenter, :body
    belongs_to :article
end
