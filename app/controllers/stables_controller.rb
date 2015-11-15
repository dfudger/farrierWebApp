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

  private
  def stable_params
		params.require(:stable).permit(:name, :owner, :phoneNo, :address, :email, :comment)
	end
end
