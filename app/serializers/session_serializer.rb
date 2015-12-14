class SessionSerializer < ActiveModel::Serializer
  attributes :value
  has_one :room
end
