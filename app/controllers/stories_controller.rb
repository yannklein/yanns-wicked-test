class StoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @stories = Story.where(status: 'active')
    @story = Story.new
  end
end
