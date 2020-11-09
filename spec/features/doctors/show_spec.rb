require 'rails_helper'

RSpec.describe "Doctors/Show", type: :feature do
  context "when I visit the doctor's show page" do
    before do
      @hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital') 
      @doctor = @hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard') 
      @patient1 = @doctor.patients.create!(name: 'Denny Duquette', age: 39)
      @patient2 = @doctor.patients.create!(name: 'Rebecca Pope', age: 32)
      @patient3 = @doctor.patients.create!(name: 'Zola Shepherd', age: 2)

      visit doctor_path(@doctor)
    end

    it 'can see the doctors name' do
      expect(page).to have_content(@doctor.name) 
    end

    it 'can see the doctors specialty' do
      expect(page).to have_content(@doctor.specialty) 
    end

    it 'can see the doctors university' do
      expect(page).to have_content(@doctor.university) 
    end

    it 'can see the doctors hospital' do
      expect(page).to have_content(@doctor.hospital_name)
    end

    it 'can see all patients the doctor has' do
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
    end

    it 'can remove a patient' do
      expect(page).to have_content(@patient1.name)
      click_button "Remove #{@patient1.name}"

      expect(page).to have_current_path(doctor_path(@doctor))
      expect(page).to_not have_content(@patient1.name)
    end
  end

  context 'when removing a patient' do
    before do
      @hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital') 
      @doctor1 = @hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard') 
      @doctor2 = @hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard') 

      @patient = Patient.create(name: 'Denny Duquette', age: 39)
      DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient.id)
      DoctorPatient.create(doctor_id: @doctor2.id, patient_id: @patient.id)
    end

    it 'does not delete the patient from the database, only the doctors caseload' do
      visit doctor_path(@doctor1)
      expect(page).to have_content(@patient.name)

      click_button "Remove #{@patient.name}"
      expect(page).to have_current_path(doctor_path(@doctor1))
      expect(page).to_not have_content(@patient.name)

      visit doctor_path(@doctor2)
      expect(page).to have_content(@patient.name)
    end
  end
end
