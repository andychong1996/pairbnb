module ListingsHelper

  def home_types
    ["Apartment", "House", "Bed & Breakfast", "Loft", "Townhouse", "Condominium", "Bungalow", "Cabin", "Villa", "Castle", "Dorm", "Treehouse", "Boat", "Plane", "Camper/RV", "Igloo", "Lighthouse", "Yurt", "Tipi", "Cave", "Island", "Chalet"]
  end

  def room_types
    ["Entire home/apt", "Private room", "Shared room"]
  end

  def countries_list
    countries = Country.all
    countries.map! do |country|
        country.name
    end
    countries.sort!
  end
end
