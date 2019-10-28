class Event < ApplicationRecord
  validates :title, length: {maximum: 64 }
  validates :something, length: {maximum: 255 }
  validates :document, format: URI::regexp(%w[http https])
  validates_presence_of :speaker, message: 'Speaker can not be blank'
  validates :speaker, length: {maximum: 32 }
  validates_presence_of :startDate, message: 'StartDate can not be blank'
  #validate :valid_start_date

  belongs_to :group

  before_save :caculate_end_date

  private

  def caculate_end_date
    self.endDate = startDate + duration.to_f.hours
  end

  def valid_start_date
    errors.add(:startDate, "Start date cannot be less than today") if startDate < Date.today
  end

end
