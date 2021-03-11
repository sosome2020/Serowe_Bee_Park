class AppointmentMailer < ApplicationMailer
def appointment_mail(appointment)
@appointment = appointment
mail to: @appointment.user.email, subject: "Inquiry confirmation email"
end
end
