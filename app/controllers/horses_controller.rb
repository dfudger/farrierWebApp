class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  # GET /clients/:client_id/horses
  # GET /clients/:client_id/horses.json
  def index
    if params.has_key?(:client_id)
      @client = Client.find(params[:client_id])
      @horses = @client.horses
    else
  		@horses = Horse.all
    end
  end

  # GET /clients/:client_id/horses/:id
  # GET /clients/:client_id/horses/:id.json
  def show
    @client = Client.find(params[:client_id])
    @horse = Horse.find(params[:id])
    #@stable = @horse.stable
  end

  # GET clients/:client_id/horses/new
  def new
    @client = Client.find(params[:client_id])
    @horse = Horse.new
  end

  # GET /clients/:client_id/horses/:id/edit
  def edit
    #@client = Client.find(params[:client_id])
    @horse = Horse.find(params[:id])
  end

  # POST /clients/:client_id/horses
  # POST /clients/:client_id/horses.json
  def create
    @client = Client.find(params[:client_id])
    @horse = @client.horses.create(horse_params)

    respond_to do |format|
      if @horse.save
        format.html { redirect_to client_horse_path(@client, @horse), notice: 'Horse was successfully created.' }
        format.json { render :show, status: :created, location: @horse }
      else
        format.html { render :new }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/:client_id/horses/:id
  # PATCH/PUT /clients/:client_id/horses/:id.json
  def update
    @client = Client.find(params[:client_id])
    @horse = @client.horses.find(params[:id])

    respond_to do |format|
      if @horse.update(horse_params)
        format.html { redirect_to client_horse_path(@client, @horse), notice: 'Horse was successfully updated.' }
        format.json { render :show, status: :ok, location: @horse }
      else
        format.html { render :edit }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/:client_id/horses/:id
  # DELETE /clients/:client_id/horses/:id.json
  def destroy
    #@client = Client.find(params[:client_id])
    @horse = @client.horses.find(params[:id])
    @horse.destroy

    respond_to do |format|
      format.html { redirect_to client_path(@client), notice: 'Horse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horse
      @horse = Horse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horse_params
      params.require(:horse).permit(:name, :photo, :comment)
    end
end
