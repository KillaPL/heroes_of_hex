# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

units = Unit.create([
	{army_id: 1, name: 'Goblin', points:60, slot:'Core', speed:5, attack:4, defense:2, damage_min:1, damage_max:2, hp:5, ammunition:0,shooting_range:0},
	{army_id: 1, name: 'Orc', points:150, slot:'Core', speed:4, attack:8, defense:4, damage_min:2, damage_max:5, hp:15, ammunition:12,shooting_range:8},
	{army_id: 1, name: 'Troll', points:500, slot:'Elite', speed:7, attack:14, defense:7, damage_min:10, damage_max:15, hp:40, ammunition:0,shooting_range:0},
	{army_id: 2, name: 'Pikeman', points:60, slot:'Core', speed:4, attack:4, defense:5, damage_min:1, damage_max:3, hp:10, ammunition:0,shooting_range:0},
	{army_id: 2, name: 'Archer', points:100, slot:'Core', speed:4, attack:6, defense:3, damage_min:2, damage_max:3, hp:10, ammunition:12,shooting_range:12},
	{army_id: 2, name: 'Swordsman', points:500, slot:'Elite', speed:7, attack:14, defense:7, damage_min:10, damage_max:15, hp:40, ammunition:0,shooting_range:0},
	])	

armies = Army.create([
	{name: 'Greenskins'},
	{name: 'United Realm'}
	])
	
