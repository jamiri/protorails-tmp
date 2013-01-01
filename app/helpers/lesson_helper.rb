module LessonHelper

  SUMMARY_LENGTH = 250

  def create_navbar(id)

    # the string that is going to be returned
    str = ""

    cat = Category.find(id)
    str = "<li><a href='#'>" << cat.name << "</a></li>" + str
    if cat.parent_id.nil?

      str

    else

      create_navbar(cat.parent_id) + str

    end

  end

  def summary(input)
    input[0..SUMMARY_LENGTH] << "..."
  end

  def replies_for(post)
    str = ""
    post.replies.each do |reply|
      str << %Q(\n <div class="reply"> <span class="id">) << reply.user.name <<
          %Q(<a class="vote-up" title="vote up this!">&nbsp;</a>
                                <a class="vote-down" title="vote down this!">&nbsp;</a>
                                <a class="reply-button" title="reply to this post!">&nbsp;</a>
                            </span> <p>) << h(reply.content) << %Q(</p>)

      str << replies_for(reply) if reply.replies
      str << %Q( \n </div>)
    end
    str
  end

end
