module HomeHelper
  def calculate_date_difference(from, to)
    dt = Date.parse(to.to_s) - Date.parse(from.to_s)
  end

  def create_child_for_category(root_categories)

    # the string that is going to be returned
    str = String.new

    root_categories.each do |p|

      str << "<li><a href='#'>#{p.name}</a>"

      if p.sub_categories.count > 0
        str << "<ul>#{create_child_for_category p.sub_categories}</ul>"
      end

      str << "</li>"
    end

    str

  end
end
