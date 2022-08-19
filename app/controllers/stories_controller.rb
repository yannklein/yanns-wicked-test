class StoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @stories = Story.all
    @story = Story.new
  end

  def create
    @story = Story.create
    redirect_to story_step_flow_path(@story, :a_cool_title)
  end

  def update
    @user = current_user
    case step
    when :confirm_password
      @user.update(user_params)
    end
    sign_in(@user, bypass: true) # needed for devise
    render_wizard @user
  end
  
  private
  def user_params
    params.require(:story).permit(:email, :current_password) # ...
  end
end
