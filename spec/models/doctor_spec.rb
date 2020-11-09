require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it { should belong_to :hospital }
    it { should have_many :doctor_patients }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'instance methods' do
    context '#hopital_name' do
      it 'should return the doctors hospital' do
        hospital = Hospital.create(name: 'Grey Sloan Memorial Hospital') 
        doctor = hospital.doctors.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard') 

        expect(doctor.hospital_name).to eq('Grey Sloan Memorial Hospital')
      end
    end
  end
end
