class ResponsesController < ApplicationController
  before_filter :load_rant
  #before_filter :load_response, only: [:edit, :update]

  def create
    @response = @rant.responses.build(response_param)
    @response.user_id = session[:user_id]
    if @response.save
      redirect_to rant_url(@rant)
    else
      render text: "Response body cannot be blank", :status => :unprocessable_entity
    end
  end

  def edit
    @response = Response.find(params[:id])
    render :partial => 'form', :locals => { rant: @rant, response: @response }
  end

  def update
    @response = Response.find(params[:id])
    redirect_to rant_url(@rant) if @response.update_attributes(response_param)
    # handle error
  end

  def up_vote
    @response = Response.find(params[:id])
    @response.vote_count += 1
    @response.save
    redirect_to rant_path(@rant)
  end

  def down_vote
    @response = Response.find(params[:id])
    @response.vote_count -= 1
    @response.save
    redirect_to rant_path(@rant)
  end

  private
  def response_param
    params.require(:response).permit!
  end

  def load_rant
    @rant = Rant.find(params[:rant_id])
  end

  #def load_response
    #@response = Response.find(params[:id])
  #end
end
