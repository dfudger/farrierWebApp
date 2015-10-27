class HorsesController < ApplicationController
  def create
    @client = Client.find(params[:client_id])
    @horse = @client.horses.create(horse_params)
    redirect_to client_path(@client)
  end

  private
  def horse_params
    params.require(:horse).permit(:name, :comment)
  end
end
