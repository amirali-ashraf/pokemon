require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


CSV.open("docs/pokemon.csv").each_with_index do |row, i|
  next if i==0
  Character.create(
    name: row[1],
    first_type: row[2].present? ? row[2].to_s.downcase : nil,
    second_type: row[3].present? ? row[3].to_s.downcase : nil,
    hp_score: row[5],
    attack_score: row[6],
    defense_score: row[7],
    sp_attack_score: row[8],
    sp_defense_score: row[9],
    speed: row[10],
    generation: row[11],
    is_legendary: row[12] == 'True' ? true : false
  )
end
