class Content < ApplicationRecord
  validates_presence_of :title, message: 'Title can not be blank'
  validates :title, length: { minimum: 6, maximum: 64 }
  validates_presence_of :description, message: 'description can not be blank'
  validates_presence_of :startDate, message: 'StartDate can not be blank'
  validates_presence_of :endDate, message: 'endDate can not be blank'
  validates_presence_of :level, message: 'endDate can not be blank'
  #validate :valid_start_date
  validate :valid_end_date
  
  belongs_to :user
  belongs_to :group
  has_many :attendances
  
  private
    def valid_start_date
      errors.add(:startDate, "Start date cannot be less than today") if startDate < Date.today
    end
  
    def valid_end_date
      errors.add(:endDate, "End date cannot be less than start date") if endDate < startDate
    end
  
end