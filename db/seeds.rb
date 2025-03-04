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

pikachu = Deck.new(name: "Pikachu EX")
pikachu.user = victoire
pikachu.save!

charizard = Deck.new(name: "Charizard EX")
charizard.user = victoire
charizard.save!

mewtwo = Deck.new(name: "Mewtwo EX")
mewtwo.user = victoire
mewtwo.save!

mew = Deck.new(name: "Mew EX")
mew.user = marc
mew.save!

dialga = Deck.new(name: "Dialga EX")
dialga.user = alvaro
dialga.save!

palkia = Deck.new(name: "Plakia EX")
palkia.user = alvaro
palkia.save!

arceus = Deck.new(name: "Arceus EX")
arceus.user = erwann
arceus.save!
