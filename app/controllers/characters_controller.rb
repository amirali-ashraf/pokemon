class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show update destroy ]

  # GET /characters
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10

    @characters = Character.page(page).per(per_page)

    @result = {
      pagination: {
        current: @characters.current_page,
        prev_page: @characters.prev_page,
        next_page: @characters.next_page,
        total_pages: @characters.total_pages,
        count: @characters.total_count
      },
      collection: @characters.as_json(method: :total_score)
    }

    render json: @result
  end

  # GET /characters/1
  def show
    render json: @character.as_json(method: :total_score)
  end

  # POST /characters
  def create
    @character = Character.new(character_params)

    if @character.save
      render json: @character, status: :created, location: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      render json: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :first_type, :second_type, :hp_score, :attack_score, :defense_score, :sp_attack_score, :sp_defense_score, :speed, :generation, :is_legendary)
    end
end
