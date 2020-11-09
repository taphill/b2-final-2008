class Hospital < ApplicationRecord
  has_many :doctors

  def number_of_doctors
    doctors.count
  end

  def unique_universities
    doctors.select(:university).distinct.pluck(:university)
  end
end
