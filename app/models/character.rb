class Character < ApplicationRecord
  TYPES = [
    :bug,
    :dark,
    :dragon,
    :electric,
    :fairy,
    :fighting,
    :fire,
    :flying,
    :ghost,
    :grass,
    :ground,
    :ice,
    :normal,
    :poison,
    :psychic,
    :rock,
    :steel,
    :water
  ].freeze

  enum :first_type, TYPES, prefix: :first_type
  enum :second_type, TYPES, prefix: :second_type

  def total_score
    hp_score + attack_score + defense_score + sp_attack_score + sp_defense_score + speed
  end
end
