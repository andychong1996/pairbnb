class Listing < ActiveRecord::Base
  belongs_to :user

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
      scoped
    end
  end

end
