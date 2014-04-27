class SnippetsController < ApplicationController
  before_filter :signed_in,    except: [:index, :show]
  before_filter :set_snippet,  only:   [:show, :edit, :update, :destroy]
  before_filter :correct_user, only:   [:edit, :update, :destroy]

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @tag = params[:tag]

    if @tag
      @snippets = Snippet.page(@page).tagged_with(@tag)
    else
      @snippets = Snippet.page(@page)
    end
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
      flash[:notice] = 'Snippet updated.'
      redirect_to @snippet
    else
      render :edit
    end
  end

  def create
    @snippet = current_user.snippets.new snippet_params
    if @snippet.save
      flash[:notice] = 'Snippet created.'
      redirect_to @snippet
    else
      render :new
    end
  end

  def destroy
    @snippet.destroy
    flash[:notice] = 'Snippet deleted.'
    redirect_to :snippets
  end

  private

  def snippet_params
    params.require(:snippet).permit(%i(
      name content permalink language_id description public tag_list
    ))
  end

  def set_snippet
    @snippet   = Snippet.find_by_permalink(params[:id])
    @snippet ||= Snippet.find_by_permalink_and_public(params[:id], false)
    not_found unless @snippet
  end

  def signed_in
    unless signed_in?
      flash[:error] = 'You must sign in to access that page'
      redirect_to :root
    end
  end

  def correct_user
    snippet = current_user.snippets.unscoped.find_by_permalink(params[:id])
    redirect_to :root if snippet.nil?
  end
end