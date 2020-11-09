class Doctors::PatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find(params[:id])
    id = doctor_patient.doctor_id

    doctor_patient.destroy
    redirect_to doctor_path(id)
  end
end

