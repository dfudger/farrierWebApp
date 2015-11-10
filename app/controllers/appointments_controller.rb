class AppointmentsController < ApplicationController
  def create
    @horse = Horse.find(params[:horse_id])
    @appointment = @horse.appointments.create(appointment_params)
    redirect_to horse_path(@horse)
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start, :end, :location)
  end
end
