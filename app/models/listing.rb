class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listings_photos
  has_many :bookings
  include PgSearch
  pg_search_scope :search, against: [:title, :description, :address, :country, :city, :state],
  using: {tsearch: {dictionary: "english"}}

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodates, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence:true

  def self.text_search(query)
    if query.present?
      search(query)
    else
      Listing.all
    end
  end

  def self.available_listings(query, search_check_in_date, search_check_out_date)
    if query.present?
      listings = Listing.text_search(query)
    else
      listings = Listing.all
    end
    available_listings = []

    listings.each do |listing|
      overlap = []
      if listing.bookings.present?
        listing.bookings.each do |booking|

            overlap << booking.overlap?(Date.parse(search_check_in_date), Date.parse(search_check_out_date), booking)
        end
        available_listings << listing unless overlap.include?(true)
      else
        available_listings << listing
      end
    end

    available_listings
  end
end
