class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :first_type
      t.integer :second_type
      t.integer :hp_score
      t.integer :attack_score
      t.integer :defense_score
      t.integer :sp_attack_score
      t.integer :sp_defense_score
      t.integer :speed
      t.integer :generation
      t.boolean :is_legendary

      t.timestamps
    end
  end
end
