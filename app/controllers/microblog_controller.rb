class MicroblogController < ApplicationController

  def create
    #TODO: exception handling

    comment_d = params[:comment]

    microblog = BlogPost.find(comment_d[:blog_post_id])

    microblog.comments << Comment.new(
        :comment => comment_d[:body],
        :user_id => 1
    )

    # TODO: the new comment should be returned.
    render :nothing => true
  end

  def get
    #TODO: exception handling required

    lesson_id = params[:lesson_id].to_i
    page = params[:page].to_i



      microblogs = BlogPost.where(:lesson_id => lesson_id)
      .includes(:comments => :user)
      .offset(5 * page)
      .limit(5)

    render :json => microblogs.to_json(:only => [:id, :title, :content],
                                       :methods => :posted_on,
                                       :include => {:comments => {:include => :user}})

  end

end
