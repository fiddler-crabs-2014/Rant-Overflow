class ResponsesController < ApplicationController
  before_filter :load_rant
  def create
    @response = @rant.responses.build(response_param)
    if @response.save
      redirect_to rant_url(@rant)
    else
      404
    end
  end

  def edit
    render "form", response: response
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
end
