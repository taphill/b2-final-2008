class Doctors::PatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.where(patient_id: params[:id], doctor_id: params[:did]).first
    id = doctor_patient.doctor_id

    doctor_patient.destroy
    redirect_to doctor_path(id)
  end
end

