class SessionSerializer < ActiveModel::Serializer
  attributes :value, :alive_until
  has_one :room
end
