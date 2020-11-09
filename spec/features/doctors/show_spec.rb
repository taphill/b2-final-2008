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
  end
end
