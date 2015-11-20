class Booking < ActiveRecord::Base

  belongs_to :user  

  validates :check_in_date, :check_out_date, overlap: {scope: "listing_id"}

  validates :user_id, presence: true
  validates :listing_id, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
end
