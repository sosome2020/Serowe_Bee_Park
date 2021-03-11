class AppointmentsController < ApplicationController
before_action :set_appointment, only: [:show, :edit, :update, :destroy]
before_action :set_users, only: [:new, :create]

def index
  @appointments = Appointment.all.order(:date, :time)
  @search = Appointment.all.ransack(params[:q])
  if params[:q]
    @appointments = @search.result.page params[:page]
  elsif params[:sort_date]
    @appointments = Appointment.all.order('date DESC').page params[:page]
  else
    @appointments = Appointment.order(:date, :time).page params[:page]
  end
end

def show
  @appointment = Appointment.find(params[:id])
  @user = @appointment.user
  @appointments = @user.appointments
end

def new
  @appointment = Appointment.new
end

def edit
end

def create
  @appointment = Appointment.new(appointment_params)
  if @appointment.save
    AppointmentMailer.appointment_mail(@appointment).deliver
    redirect_to appointments_path
  else
    render :new
  end
end

def destroy
  @appointment.destroy
  redirect_to appointments_path
end

private

def set_appointment
  @appointment = Appointment.find(params[:id])
end

def set_users
  @users = User.all.order("name")
end

def appointment_params
  params.require(:appointment).permit(:user_id, :date, :time)
end
end
