class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  attributes :created_at, :updated_at

  has_many :articles
end
