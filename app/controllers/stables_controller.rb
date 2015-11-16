class StablesController < ApplicationController
  def new
    @stable = Stable.new
  end

  def create
    @stable = Stable.new(stable_params)

    if @stable.save
      redirect_to @stable
    else
      render 'new'
    end
  end

  def show
    @stable = Stable.find(params[:id])
    #@horse = Horse.find(params[:id])
  end

  def index
    @stables = Stable.all
  end

  private
  def stable_params
		params.require(:stable).permit(:name, :owner, :phoneNo, :address, :email, :comment)
	end
end
