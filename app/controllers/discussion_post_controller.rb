class DiscussionPostController < ApplicationController

  def latest
    not_found('forbidden!') unless request.xhr?

    @posts = DiscussionPost.latest(5)
  end

end
