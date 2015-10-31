class HorsesController < ApplicationController
  http_basic_authenticate_with name: "dani", password: "secret", only: :destroy

  def create
    @client = Client.find(params[:client_id])
    @horse = @client.horses.create(horse_params)
    redirect_to client_path(@client)
  end

  def new
    @client = Client.find(params[:client_id])
		@horse = Horse.new
	end

  def show
    @client = Client.find(params[:client_id])
    @horse = Horse.find(params[:id])
  end

  def destroy
      @client = Client.find(params[:client_id])
      @horse = @client.horses.find(params[:id])
      @horse.destroy
      redirect_to client_path(@client)
    end
  private
  def horse_params
    params.require(:horse).permit(:name, :comment)
  end
end
