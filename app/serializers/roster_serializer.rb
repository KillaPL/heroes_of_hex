class RosterSerializer 
  def initialize(roster)
    @roster = roster
  end

  def to_hash
    {
      id: @roster.id,
      user_id: @roster.user_id,
      points_limit: @roster.points_limit,
      name: @roster.name,
      troops: @roster.troops.map {|troop| {unit_size: troop.unit_size, total_price: troop.total_price, 
        unit_id: troop.unit_id, unit_name: troop.unit.name, unit_price: troop.unit.points}},
    }
  end
end