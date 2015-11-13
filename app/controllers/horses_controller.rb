class HorsesController < ApplicationController
  http_basic_authenticate_with name: "dani", password: "secret", only: :destroy

  def index
    if params.has_key?(:client_id)
      @client = Client.find(params[:client_id])
      @horses = @client.horses
    else
  		@horses = Horse.all
    end
	end

  def create
    @client = Client.find(params[:client_id])
    @horse = @client.horses.create(horse_params)
    redirect_to client_path(@client)
  end

  def new
    @client = Client.find(params[:client_id])
		@horse = Horse.new
	end

  def edit
    @client = Client.find(params[:client_id])
    @horse = Horse.find(params[:id])
  end

  def update
  	@client = Client.find(params[:client_id])
    @horse = @client.horses.find(params[:id])

    if @horse.update(horse_params)
		  redirect_to client_horse_path(@client, @horse)
		else
		  render 'edit'
		end
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
