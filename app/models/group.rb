class Group < ApplicationRecord
    validates :name,        presence: true, uniqueness: true, length: { maximum: 64   }
    validates :decription,  presence: true,  length: { maximum: 255  }
    validates :startdate, presence: true
    mount_uploader :picture, PictureUploader
    mount_uploader :cover, CoverUploader
    belongs_to :course
    has_many :contents
    has_many :events
    has_many :roles, :dependent => :destroy
    has_many :users, through: :roles


    scope :running_by_course, -> (course_id) {
      where(course_id: course_id).where("startdate <= ?", Date.today)
    }

    scope :comming_by_course, ->(course_id) {
      where(course_id: course_id).where("startdate > ?", Date.today)
    }


end
