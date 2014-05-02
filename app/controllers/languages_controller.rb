# Languages are only created and updated through seeds or the console itself.
class LanguagesController < ApplicationController

  # The default /languages page, ordered alphabetically.
  def index
    @languages = Language.all.order(:name)
  end

  # Shows a Language and all of its Snippets.
  def show
    @language = Language.find_by_name params[:id]
  end
end
