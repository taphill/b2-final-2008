require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'instance methods' do
    context '#number_of_doctors' do
      it 'should return the number of doctors at that hospital' do
        hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital') 
        doctor1 = hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard') 
        doctor2 = hospital.doctors.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins') 
        doctor3 = hospital.doctors.create(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford') 

        expect(hospital.number_of_doctors).to eq(3)
      end
    end

    context '#unique_universities' do
      it "should return a unique list of universities atteneded by a hospital's doctors" do
        hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital') 
        doctor1 = hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard') 
        doctor2 = hospital.doctors.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins') 
        doctor3 = hospital.doctors.create(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Harvard') 

        expect(hospital.unique_universities).to eq(['Harvard', 'Johns Hopkins'])
      end
    end
  end
end
