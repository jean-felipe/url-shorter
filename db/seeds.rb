# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

WebSite.create([
  { title: 'Youtube', url: 'https://www.youtube.com/', shorted_url: SecureRandom.hex(2), counter: 2 },
  { title: 'CNN International', url: 'https://edition.cnn.com/', shorted_url: SecureRandom.hex(2), counter: 1 },
  { title: 'Hack News', url: 'https://news.ycombinator.com/', shorted_url: SecureRandom.hex(2), counter: 3 },
  { title: 'Home/Twitter', url: 'https://twitter.com/home', shorted_url: SecureRandom.hex(2), counter: 2 },
  { title: 'Classico game', url: 'https://www.tribalwars.com.br/', shorted_url: SecureRandom.hex(2), counter: 1 },
  { title: 'Facebook', url: 'https://www.facebook.com/', shorted_url: SecureRandom.hex(2), counter: 6 },
  { title: 'Nintendo Brasil', url: 'https://www.nintendo.com/pt_BR/', shorted_url: SecureRandom.hex(2), counter: 2 },
  { title: 'Bem vindo', url: 'https://store.steampowered.com/?l=portuguese', shorted_url: SecureRandom.hex(2), counter: 1 },
  { title: 'Lol Esposts', url: 'https://br.lolesports.com/', shorted_url: SecureRandom.hex(2), counter: 2 }
])
 