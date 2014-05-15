class RantsController < ApplicationController

  def index #get all rants
    @rants = Rant.all
  end

  def show #get particular rant
    @rant = Rant.find(params[:id])
    @responses = @rant.responses
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
      render :show
    else
      @errors = @rant.errors.full_messages
      redirect_to action: 'create'
    end
  end

  def edit #get edit page
    @rant = Rant.find(params[:id])
    unless session[:user_id] == @rant.user.id
      redirect_to action: 'show'
    end
  end

  def update #put edits and redirects to show
    rant = Rant.find(params[:id]) #make form have a hidden field ID!
    rant.update(rant_params)

    rant.save
    redirect_to action: 'show'
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
