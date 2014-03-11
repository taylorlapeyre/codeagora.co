class Api::LanguagesController < ApplicationController
  layout false

  # Languages are only created and updated through seeds or the console itself.

  def index
    @languages = Language.all
  end

  def show
    @language = Language.find_by_name params[:id]
  end
end
