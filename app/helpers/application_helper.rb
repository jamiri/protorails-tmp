module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end

  # Available options are as follows:

  # in_effect_duration:   600,## in effect duration in miliseconds
  # stay_time:           3000, ## time in miliseconds before the item has to disappear
  # sticky:            false,  ## should the toast item sticky or not?
  # type:           :notice,   ## notice, warning, error, success
  # position:   'top-right',  ## top-left, top-center, top-right, middle-left, middle-center, middle-right
  #                            ## Position of the toast container holding different toast.
  #                            ## Position can be set only once at the very first call,
  #                            ## changing the position after the first call does nothing

  def show_message(message, options = {:type => :notice})
    flash_with_options = {:text => h(message)}

    # Convert Ruby-style key names to Javascript-style key names
    options.each do |key, value|
      new_key = key.to_s.camelize(:lower).to_sym
      flash_with_options.merge!(new_key => value)
    end

    # Find flash type (if exists) from type of message
    # note that by using this function, flash objects are saved as follows {:errors => {:error => {}, },
    #   :successes => {:success => {}, ...} :notices => {:notice => {}, ...}, :warnings => {:warning => {}, ...}}
    flash_type = options[:type].to_s.pluralize.to_sym

    # If any flash type is initialized before then the new message is added unless a new flash type is created
    if (flash[flash_type])
      flash[flash_type].merge!(flash_with_options[:text].to_sym => flash_with_options)
    else
      flash[flash_type] = {flash_with_options[:text].to_sym => flash_with_options}
    end
  end

  def clear_flash_messages
    flash[:errors] = nil
    flash[:successes] = nil
    flash[:notices] = nil
    flash[:warnings] = nil
  end
end
