require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get characters_url, as: :json
    assert_response :success
  end

  test "should create character" do
    assert_difference("Character.count") do
      post characters_url, params: { character: { attack_score: @character.attack_score, defense_score: @character.defense_score, first_type: @character.first_type, generation: @character.generation, is_legendary: @character.is_legendary, name: @character.name, second_type: @character.second_type, sp_attack_score: @character.sp_attack_score, sp_defense_score: @character.sp_defense_score, speed: @character.speed } }, as: :json
    end

    assert_response :created
  end

  test "should show character" do
    get character_url(@character), as: :json
    assert_response :success
  end

  test "should update character" do
    patch character_url(@character), params: { character: { attack_score: @character.attack_score, defense_score: @character.defense_score, first_type: @character.first_type, generation: @character.generation, is_legendary: @character.is_legendary, name: @character.name, second_type: @character.second_type, sp_attack_score: @character.sp_attack_score, sp_defense_score: @character.sp_defense_score, speed: @character.speed } }, as: :json
    assert_response :success
  end

  test "should destroy character" do
    assert_difference("Character.count", -1) do
      delete character_url(@character), as: :json
    end

    assert_response :no_content
  end
end
