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
end
