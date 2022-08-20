class Stories::BuildController < ApplicationController
  include Wicked::Wizard
  skip_before_action :authenticate_user!
  steps :a_cool_title, :a_proud_hero, :some_nice_place, :a_terrific_enemy, :a_fabulous_treasure, :final_story

  def show
    @story = Story.find(params[:story_id])
    @step_name = step
    case step
    when :a_terrific_enemy
      @enemy_name = ["Dark Vador", "Voldemor", "Palpatine", "Thanos"].sample
    end
    render_wizard
  end

  def create
    @story = Story.create
    redirect_to wizard_path(steps.first, story_id: @story.id)
  end

  def update
    @story = Story.find(params[:story_id])
    @story.update(story_params)
    @story.active! if step == steps.second_to_last
    render_wizard @story
  end

  private

  def story_params
    params.require(:story).permit(:title, :hero, :location, :enemy, :treasure)
  end
end
