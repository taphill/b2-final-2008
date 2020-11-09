require 'rails_helper'

RSpec.describe "Hospitals/Show", type: :feature do
  context 'when I visit a hospitals show page' do
    before do
      @hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital') 
      @doctor1 = @hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard') 
      @doctor2 = @hospital.doctors.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins') 
      @doctor3 = @hospital.doctors.create(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Harvard') 

      visit hospital_path(@hospital)
    end

    it 'has the hospitals name' do
      expect(page).to have_content(@hospital.name)
    end

    it 'has the number of doctors that work at the hospital' do
      expect(page).to have_content('3')
    end

    it "has unique list of universities that the hospital's doctors attended" do
      expect(page).to have_content('Harvard')
      expect(page).to have_content('Johns Hopkins')
    end
  end
end
