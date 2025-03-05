require "open-uri"

Booking.destroy_all
Deck.destroy_all
User.destroy_all

# asset = single card
def get_asset_urls
  asset_folders = [
    "ex-team-magma-vs-team-aqua",
    "jumbo",
    "mcdonalds",
    "pokemon-organized-play-series-1",
    "pokemon-organized-play-series-2",
    "pokemon-organized-play-series-3",
    "pokemon-organized-play-series-4",
    "pokemon-organized-play-series-5",
    "pokemon-organized-play-series-6",
    "pokemon-organized-play-series-7",
  ]

  random_folders = asset_folders.sample(3)
  random_assets = random_folders.map do |folder|
    Cloudinary::Api.resources_by_asset_folder(folder)["resources"].sample(4)
  end.flatten

  random_urls = random_assets.map do |asset|
    asset["url"]
  end

  random_urls
end

def associate_photos(deck)
  get_asset_urls.each do |url|
    file = URI.parse(url).open
    deck.photos.attach(io: file, filename: "random.jpg", content_type: "image/jpg")
  end
end

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

pikachu = Deck.new(title: "Pikachu EX")
associate_photos(pikachu)
pikachu.user = victoire
pikachu.save!

charizard = Deck.new(title: "Charizard EX")
associate_photos(charizard)
charizard.user = victoire
charizard.save!

mewtwo = Deck.new(title: "Mewtwo EX")
associate_photos(mewtwo)
mewtwo.user = victoire
mewtwo.save

mew = Deck.new(title: "Mew EX")
associate_photos(mew)
mew.user = marc
mew.save!

dialga = Deck.new(title: "Dialga EX")
associate_photos(dialga)
dialga.user = alvaro
dialga.save!

palkia = Deck.new(title: "Palkia EX")
associate_photos(palkia)
palkia.user = alvaro
palkia.save!

arceus = Deck.new(title: "Arceus EX")
associate_photos(arceus)
arceus.user = erwann
arceus.save!
