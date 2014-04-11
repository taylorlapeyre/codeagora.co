class SnippetsController < ApplicationController
  before_filter :signed_in,    except: [:index, :show]
  before_filter :set_snippet,  only:   [:show, :edit, :update, :destroy]
  before_filter :correct_user, only:   [:edit, :update, :destroy]

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @snippets = Snippet.page(@page)
  end

  def train
    require 'ruby-fann'

    # Collect data for training
    num_languages = Language.all.count
    training_data = Snippet.all.map(&:to_training_data)

    # Use inputs as letter frequecy and outputs as desired language
    inputs = training_data.map { |i| i[0] }
    ouputs = training_data.map { |i| i[1] }

    # Create the fann train data object
    train = RubyFann::TrainData.new(:inputs=>inputs, :desired_outputs=>ouputs)

    # Create the artificial neural network
    fann = RubyFann::Standard.new(:num_inputs=>128, :hidden_neurons=>[64, 32, 8], :num_outputs=>num_languages)
    
    # Train the network
    fann.train_on_data(train, 1000, 10, 0.01) # 1000 max_epochs, 10 errors between reports and 0.01 desired MSE (mean-squared-error)
    # Test the first snippet.  Why not?
    outputs = fann.run(Snippet.first.to_training_data[0])

    @hash_out = Hash[outputs.each_with_index.map { |v, i| [i, v] }]
    @sorted = @hash_out.sort_by {|k,v| v}.reverse

    render :train
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
      name content permalink language_id description public
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
