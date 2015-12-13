class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :point_limit, :sessions_count
end
