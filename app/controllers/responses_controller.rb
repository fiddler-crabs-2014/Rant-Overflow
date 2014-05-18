class ResponsesController < ApplicationController
  before_filter :load_rant, :load_response

  def create
    @response = @rant.responses.build(response_param)
    if @response.save
      redirect_to rant_url(@rant)
    else
      render text: "Response body cannot be blank", :status => :unprocessable_entity
    end
  end

  def edit
    render :partial => 'form', :locals => { rant: @rant, response: @response }
  end

  def update
    if @response.update_attributes(response_param)
      redirect_to rant_url(@rant)
    end
  end

  private
  def response_param
    params.require(:response).permit!
  end

  def load_rant
    @rant = Rant.find(params[:rant_id])
  end

  def load_response
    @response = Response.find(params[:id])
  end
end
