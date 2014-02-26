class LanguagesController < ApplicationController

  # Languages are only created and updated through seeds or the console itself.

  def index
    # Idea:
    # @languages = Language.all.map do |language|
    #   {
    #     name: language.name,
    #     description: language.description,
    #     snippet_count: language.snippets.count
    #     loc_count: language.snippets.sum { |s| s.content.split("\n").count }
    #   }
    # end
    @languages = Language.all
  end

  def show
    @language = Language.find_by_name params[:id]
  end
end