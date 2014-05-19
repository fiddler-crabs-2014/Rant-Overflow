class RantsController < ApplicationController

  def index
    # using enumberable instead of sql
    #@rants = Rant.all.to_a.sort_by(&:vote_count).reverse
    @rants = Rant.order('vote_count DESC')
  end

  def show #get particular rant
    @rant = Rant.find(params[:id])
    # Add [0..-1] to exclude @response from @responses
    #@responses = @rant.responses[0..-1].sort_by(&:id)
    @responses = @rant.responses.order(:id)[0..-1]
    @response = @rant.responses.build
  end

  def new #get page to create new rant
    @rant = Rant.new
  end

  def create #post new rant and redirect to show
    @rant = Rant.new(rant_params)

    if signed_in? #session[:user_id]
      @rant.user = User.find(session[:user_id])
    end

    if @rant.save
      @response = Response.new
      #render :show
      redirect_to @rant
    else
      @errors = @rant.errors.full_messages
      #redirect_to action: 'create'
      render :new
    end
  end

  def edit #get edit page
    @rant = Rant.find(params[:id])

    # be consistent re: checking authentication
    redirect_to :show unless session[:user_id] == @rant.user_id
  end

  def update #put edits and redirects to show
    rant = Rant.find(params[:id]) #make form have a hidden field ID!
    rant.update(rant_params)

    # check for sucessful update and handle error

    #rant.save
    redirect_to :show
  end

  def up_vote
    up_rant = Rant.find(params[:id])
    up_rant.vote_count += 1

    if up_rant.save
      respond_to do |format|
        format.html
        format.json { render :json => { vote_count: up_rant.vote_count }}
      end
    # handle failure
    end
  end

  # combine up and down
  def down_vote
    down_rant = Rant.find(params[:id])
    down_rant.vote_count -= 1

    if down_rant.save
      render :json => { vote_count: down_rant.vote_count }}
      #respond_to do |format|
        #format.html
        #format.json { render :json => { vote_count: down_rant.vote_count }}
      #end
    end
  end

  def destroy #delete goes to index
    Rant.destroy(params[:id])
    redirect_to 'index'
  end

  private
  def rant_params
    params.require(:rant).permit(:title, :body)
  end

end
