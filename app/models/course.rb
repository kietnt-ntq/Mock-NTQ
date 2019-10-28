class Course < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { maximum: 64   }

    has_many :groups
end
