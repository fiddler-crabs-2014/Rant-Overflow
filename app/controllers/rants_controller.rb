class RantsController < ApplicationController

  def index #get all rants
    @rants = Rant.all.to_a.sort_by(&:vote_count).reverse
  end

  def show #get particular rant
    @rant = Rant.find(params[:id])
    # Add [0..-1] to exclude @response from @responses
    @responses = @rant.responses[0..-1]
    @response = @rant.responses.build
  end

  def new #get page to create new rant
    @rant = Rant.new
  end

  def create #post new rant and redirect to show
    @rant = Rant.new(rant_params)
    if session[:user_id]
      @rant.user = User.find(session[:user_id])
    end
    if @rant.save
      @response = Response.new
      render :show
    else
      @errors = @rant.errors.full_messages
      redirect_to action: 'create'
    end
  end

  def edit #get edit page
    @rant = Rant.find(params[:id])
    unless session[:user_id] == @rant.user_id
      redirect_to action: 'show'
    end
  end

  def update #put edits and redirects to show
    rant = Rant.find(params[:id]) #make form have a hidden field ID!
    rant.update(rant_params)

    rant.save
    redirect_to action: 'show'
  end

  def up_vote
    up_rant = Rant.find(params[:id])
    p "vote count:" + up_rant.vote_count.to_s
    up_rant.vote_count += 1
    up_rant.save
    p "vote count:" + up_rant.vote_count.to_s
    redirect_to "/rants/#{params[:id]}"
  end

  def down_vote
    down_rant = Rant.find(params[:id])
    p "vote count:" + down_rant.vote_count.to_s
    down_rant.vote_count -= 1
    down_rant.save
    p "vote count:" + down_rant.vote_count.to_s
    redirect_to "/rants/#{params[:id]}"
  end

  def destroy #delete goes to index
    Rant.destroy(params[:id])
    redirect_to action: 'index'
  end

  private
  def rant_params
    params.require(:rant).permit(:title, :body)
  end

end
