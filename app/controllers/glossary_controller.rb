class GlossaryController < ApplicationController

  def lookup_lesson_terms
    # TODO: exception handling

    words = GlossaryEntry.for_lesson(params[:id])

    render :json => words.to_json(:only => [:id, :name, :short_definition])
  end

  def lookup_term
    # TODO: exception handling

    word = GlossaryEntry.lookup(params[:term]).first

    respond_to do |format|
      format.json { render :json => word.to_json(:only =>
                                                     [:name, :short_definition, :full_definition,
                                                      :image_file, :pronun_file, :ext_link]) }
    end
  end

end