class Character < ApplicationRecord
  attribute :total_score
  validates :name, uniqueness: true
  validates :first_type, presence: true
  validates :second_type, presence: true
  validates :hp_score, numericality: true
  validates :attack_score, numericality: true
  validates :defense_score, numericality: true
  validates :sp_attack_score, numericality: true
  validates :sp_defense_score, numericality: true
  validates :speed, numericality: true
  validates :is_legendary, inclusion: [true, false]
  validates :generation, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 6
  }

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
    total_score = 0
    total_score += hp_score if hp_score
    total_score += attack_score if attack_score
    total_score += defense_score if defense_score
    total_score += sp_attack_score if sp_attack_score
    total_score += sp_defense_score if sp_defense_score
    total_score += speed if speed
  end
end
