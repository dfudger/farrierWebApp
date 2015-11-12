class AppointmentsController < ApplicationController
  def create
    @horse = Horse.find(params[:horse_id])
    @client = @horse.client
    @appointment = @horse.appointments.create(appointment_params)

    redirect_to client_horse_path(@client, @horse)
  end

  def new
    @horse = Horse.find(params[:horse_id])
    @appointment = Appointment.new
	end

  def edit
    @horse = Horse.find(params[:horse_id])
    @client = @horse.client
    @appointment = @horse.appointments.create(appointment_params)
  end

  def update
    @horse = Horse.find(params[:horse_id])
    @client = @horse.client
    @appointment = @horse.appointments.create(appointment_params)

    if @appointment.update(appointment_params)
		  redirect_to client_horse_path(@client, @horse)
		else
		  render 'edit'
		end
	end

  private
  def appointment_params
    params.require(:appointment).permit(:start, :end, :location)
  end
end
