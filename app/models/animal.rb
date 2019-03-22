class Animal < ApplicationRecord
    has_many :sightings
    
    validates :name, :latin_name, :kingdom, presence: true
    validates :name, uniqueness: true
    validates :name, :latin_name, :kingdom, format: {:with => /\A[a-z0-9\s]+\Z/i, message: "should contain only letters"}
end
