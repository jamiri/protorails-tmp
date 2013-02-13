class SuggestionController < ApplicationController

  def latest
    @suggestions = ContentSuggestion.latest(5)
  end

  def most_popular

  end
end