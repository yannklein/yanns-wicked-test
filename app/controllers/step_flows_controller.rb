class StepFlowsController < ApplicationController
  skip_before_action :authenticate_user!
  
  include Wicked::Wizard
  steps :a_cool_title, :a_proud_hero, :some_nice_place, :a_terrific_enemy, :a_fabulous_treasure, :final_story

  def show
    @story = Story.find(params[:story_id])
    @step_name = step
    case step
    when :a_terrific_enemy
      @enemy_attribute = ["scary eyes", "bold head", "crooked hand", "picked tail"].shuffle
    end
    render_wizard
  end
end
