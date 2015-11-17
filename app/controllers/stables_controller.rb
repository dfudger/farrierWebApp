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

  end

  def index
    @stables = Stable.all
  end

  def edit
		@stable = Stable.find(params[:id])
	end

  def update
  	@stable = Stable.find(params[:id])

		if @stable.update(stable_params)
		  redirect_to @stable
		else
		  render 'edit'
		end
	end

  def destroy
	  @stable = Stable.find(params[:id])
	  @stable.destroy

	  redirect_to stables_path
	end

  private
  def stable_params
		params.require(:stable).permit(:name, :owner, :phoneNo, :address, :email, :comment)
	end
end
