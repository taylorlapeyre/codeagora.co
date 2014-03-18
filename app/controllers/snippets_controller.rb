class SnippetsController < ApplicationController
  before_filter :signed_in,    except: [:index, :show]
  before_filter :set_snippet,  only:   [:show, :edit, :update, :destroy]
  before_filter :correct_user, only:   [:edit, :update, :destroy]

  def index
    @snippets = Snippet.all
  end

  def show
  end

  def edit
  end

  def new
    @snippet = Snippet.new
  end

  def update
    if @snippet.update snippet_params
      flash[:notice] = "Snippet updated."
      redirect_to @snippet
    else
      render :edit
    end
  end

  def create
    @snippet = current_user.snippets.new snippet_params
    if @snippet.save
      flash[:notice] = "Snippet created."
      redirect_to @snippet
    else
      render :new
    end
  end

  def destroy
    @snippet.destroy
    flash[:notice] = "Snippet deleted."
    redirect_to :index
  end

  private

    def snippet_params
      params.require(:snippet).permit(:name, :content, :permalink, :language_id, :description, :public)
    end

    def set_snippet
      @snippet   = Snippet.find_by_permalink(params[:id])
      @snippet ||= Snippet.find_by_permalink_and_public(params[:id], false)
    end

    def signed_in
      unless signed_in?
        flash[:error] = "You must sign in to access that page"
        redirect_to :sign_up
      end
    end

    def correct_user
      snippet = set_snippet
      redirect_to :root unless snippet.user == current_user
    end
end
