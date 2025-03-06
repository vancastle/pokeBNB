require "open-uri"

DeckCard.destroy_all
Card.destroy_all
Booking.destroy_all
Deck.destroy_all
User.destroy_all

# Users seed
erwann = User.create!(
  username: "edefoy",
  password: "pwd123",
  email: "erwann@gamil.com"
)

alvaro = User.create!(
  username: "vancastle",
  password: "pwd123",
  email: "alvaro@gamil.com"
)

victoire = User.create!(
  username: "VictoireBB",
  password: "pwd123",
  email: "victoire@gamil.com"
)

marc = User.create!(
  username: "MarcPLAGNES",
  password: "pwd123",
  email: "marc@gamil.com"
)

all_users = [erwann, alvaro, victoire, marc]

# Cards seed
asset_folders = [
  "ex-team-magma-vs-team-aqua",
  "jumbo",
  "mcdonalds"
]

def extract_card_name(url)
  match = url.match(%r{/([^/_]+)_})
  match ? match[1].gsub("-", " ") : nil
end

asset_folders.each do |folder|
  assets = Cloudinary::Api.resources_by_asset_folder(folder)["resources"]
  assets.each do |asset|
    img_url = asset["url"]
    file = URI.parse(img_url).open
    name = extract_card_name(img_url)
    card = Card.new(name: name)
    card.photo.attach(io: file, filename: "random.jpg", content_type: "image/jpg")
    card.save!
  end
end

cards = Card.all

# Decks seed (with DeckCards)
10.times do
  deck = Deck.new(
    title: Faker::Games::Pokemon.location,
    description: "this is a description of this deck",
    price: 5
  )

  taken_title = Deck.find_by(title: deck.title)

  if taken_title.nil?
    deck.user = all_users.sample
    deck.save!

    20.times do
      card = cards.sample
      DeckCard.create!(deck_id: deck.id, card_id: card.id)
    end

    cloudinary_url = deck.cards.first.photo.url
    file = URI.parse(cloudinary_url).open

    deck.photo.attach(io: file, filename: "pokemon")

  end
end

# # #
# # #

# # asset = single card
# def get_asset_urls
#   asset_folders = [
#     "ex-team-magma-vs-team-aqua",
#     "jumbo",
#     "mcdonalds",
#     "pokemon-organized-play-series-1",
#     "pokemon-organized-play-series-2",
#     "pokemon-organized-play-series-3",
#     "pokemon-organized-play-series-4",
#     "pokemon-organized-play-series-5",
#     "pokemon-organized-play-series-6",
#     "pokemon-organized-play-series-7"
#   ]

#   random_folders = asset_folders.sample(5)
#   random_assets = random_folders.map do |folder|
#     Cloudinary::Api.resources_by_asset_folder(folder)["resources"].sample(4)
#   end.flatten

#   random_urls = random_assets.map do |asset|
#     asset["url"]
#   end

#   random_urls
# end

# def associate_photos(deck)
#   get_asset_urls.each_with_index do |url, index|
#     file = URI.parse(url).open
#     card = Card.new(name: extract_pokemon_name(url))
#     card.photo.attach(io: file, filename: "random.jpg", content_type: "image/jpg")
#     card.save!

#     if index.zero?
#       deck.photo.attach(io: file, filename: "random.jpg", content_type: "image/jpg")
#       deck.user = all_users.sample
#       deck.save!
#     end

#     DeckCard.new(card_id: card.id, deck_id: deck.id)
#   end
# end
