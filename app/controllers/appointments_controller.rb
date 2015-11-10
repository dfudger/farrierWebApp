class AppointmentsController < ApplicationController
  def create
    @horse = Horse.find(params[:horse_id])
    @client = @horse.client
    @appointment = @horse.appointments.create(appointment_params)

    redirect_to client_horse_path(@client, @horse)
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start, :end, :location)
  end
end
