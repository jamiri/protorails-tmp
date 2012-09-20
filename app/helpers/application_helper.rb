module ApplicationHelper
  def title(page_title)
    if page_title
      content_for :title, page_title.to_s
    else
      'SalaamPod'
    end
  end
end
