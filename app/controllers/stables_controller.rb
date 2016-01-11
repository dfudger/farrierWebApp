class StablesController < ApplicationController
  before_action :set_stable, only: [:show, :edit, :update, :destroy]

  # GET /stables
  # GET /stables.json
  def index
    @stables = Stable.all
  end

  # GET /stables/1
  # GET /stables/1.json
  def show
  end

  # GET /stables/new
  def new
    @stable = Stable.new
  end

  # GET /stables/1/edit
  def edit
  end

  # POST /stables
  # POST /stables.json
  def create
    @stable = Stable.new(stable_params)

    respond_to do |format|
      if @stable.save
        format.html { redirect_to @stable, notice: 'Stable was successfully created.' }
        format.json { render :show, status: :created, location: @stable }
      else
        format.html { render :new }
        format.json { render json: @stable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stables/1
  # PATCH/PUT /stables/1.json
  def update
    respond_to do |format|
      if @stable.update(stable_params)
        format.html { redirect_to @stable, notice: 'Stable was successfully updated.' }
        format.json { render :show, status: :ok, location: @stable }
      else
        format.html { render :edit }
        format.json { render json: @stable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stables/1
  # DELETE /stables/1.json
  def destroy
    @stable.destroy
    respond_to do |format|
      format.html { redirect_to stables_url, notice: 'Stable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stable
      @stable = Stable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stable_params
      params.require(:stable).permit(:name, :owner, :phoneNo, :address, :email, :comment)
    end
end
