Booking.destroy_all
Deck.destroy_all
User.destroy_all

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

charizard = Deck.new(
  title: "Charizard EX",
  description: "A deck centered around Charizard",
  img_url: "https://snapjson.untapped.gg/pocketjson/art/cards/cPK_20_000360_01_LIZARDONex_IM_M_M_en_US.webp"
)
charizard.user = victoire
charizard.save!

pikachu = Deck.new(
  title: "Pikachu EX",
  description: "A deck centered around Pikachu",
  img_url: "https://snapjson.untapped.gg/pocketjson/art/cards/cPK_20_000960_01_PIKACHUex_IM_M_M_en_US.webp"
)
pikachu.user = victoire
pikachu.save!

mewtwo = Deck.new(
  title: "Mewtwo EX",
  description: "A deck centered around Mewtwo",
  img_url: "https://snapjson.untapped.gg/pocketjson/art/cards/cPK_20_001290_01_MEWTWOex_IM_M_M_en_US.webp"
)
mewtwo.user = victoire
mewtwo.save!

mew = Deck.new(
  title: "Mew EX",
  description: "A deck centered around Mew",
  img_url: "https://snapjson.untapped.gg/pocketjson/art/cards/cPK_20_002140_00_MEW_IM_M_M_en_US.webp"
)
mew.user = marc
mew.save!

celebi = Deck.new(
  title: "Celebi EX",
  description: "A deck centered around Celebi",
  img_url: "https://snapjson.untapped.gg/pocketjson/art/cards/cPK_20_002170_01_CELEBIex_IM_M_M_en_US.webp"
)
celebi.user = marc
celebi.save!

palkia = Deck.new(
  title: "Plakia EX",
  description: "A deck centered around Palkia",
  img_url: "https://snapjson.untapped.gg/pocketjson/art/cards/cPK_20_003300_01_PALKIAex_IM_M_M_en_US.webp"
)
palkia.user = alvaro
palkia.save!

dialga = Deck.new(
  title: "Dialga EX",
  description: "A deck centered around Dialga",
  img_url: "https://snapjson.untapped.gg/pocketjson/art/cards/cPK_20_004000_01_DIALGAex_IM_M_M_en_US.webp"
)
dialga.user = alvaro
dialga.save!

arceus = Deck.new(
  title: "Arceus EX",
  description: "A deck centered around Arceus",
  img_url: "https://snapjson.untapped.gg/pocketjson/art/cards/cPK_20_004950_01_ARCEUSex_IM_M_M_en_US.webp"
)
arceus.user = erwann
arceus.save!
