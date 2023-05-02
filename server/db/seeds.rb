# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "\n**"
puts '* Adding Publishers'
puts '*'

paste_mag = Publisher.create(name: 'Paste Magazine')
pub_weekly = Publisher.create(name: 'Publishers Weekly')
graywolf_press = Publisher.create(name: 'Graywolf Press')
mcsweeney = Publisher.create(name: "McSweeney's")

puts "\n**"
puts "* Done Adding #{Publisher.count} Publishers"
puts '*'

puts "\n**"
puts '* Adding Authors'
puts '*'

author1 = Author.create(
  first_name: 'Joel',
  last_name: 'Hartse'
)
author2 = Author.create(
  first_name: 'Hannah',
  middle_name: 'P.',
  last_name: 'Templer'
)
author3 = Author.create(
  first_name: 'Marguerite',
  middle_name: 'Z.',
  last_name: 'Duras'
)
author4 = Author.create(
  first_name: 'Kingsley',
  last_name: 'Amis'
)
author5 = Author.create(
  first_name: 'Fannie',
  middle_name: 'Peters',
  last_name: 'Flagg'
)
author6 = Author.create(
  first_name: 'Camille',
  middle_name: 'Byron',
  last_name: 'Paglia'
)
author7 = Author.create(
  first_name: 'Rainer',
  middle_name: 'Steel',
  last_name: 'Rilke'
)

puts "\n**"
puts "* Done Adding #{Author.count} Authors"
puts '*'

puts "\n**"
puts '* Adding Books'
puts '*'

book1 = Book.create(
  title: 'American Elf',
  isbn: '9781891830853',
  publication_year: 2004,
  publisher_id: paste_mag.id,
  price: 1000.00,
  edition: 'Book 2',
  image_url: 'https://www.topshelfcomix.com/catalog/covers/americanelfvol2_lg.jpg'
)
book1.authors << [author1, author2, author3]

book2 = Book.create(
  title: 'Cosmoknights',
  isbn: '9781603094542',
  publication_year: 2019,
  publisher_id: pub_weekly.id,
  price: 2000.00,
  edition: 'Book 1',
  image_url: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/hostedimages/1624734807i/31553044._SY540_.jpg'
)
book2.authors << author4

book3 = Book.create(
  title: 'Essex County',
  isbn: '9781603090384',
  publication_year: 1990,
  publisher_id: graywolf_press.id,
  price: 500.00,
  image_url: 'https://m.media-amazon.com/images/I/61Bsh18xq4L._SX331_BO1,204,203,200_.jpg'
)
book3.authors << author4

book4 = Book.create(
  title: 'Hey, Mister (Vol 1)',
  isbn: '9781891830020',
  publication_year: 2000,
  publisher_id: graywolf_press.id,
  price: 1200.00,
  edition: 'After School Special',
  image_url: 'https://pictures.abebooks.com/isbn/9781891830020-us.jpg'
)
book4.authors << [author2, author5, author6]

book5 = Book.create(
  title: 'The Underwater Welder',
  isbn: '9781603093989',
  publication_year: 2022,
  publisher_id: mcsweeney.id,
  price: 3000.00,
  image_url: 'https://s3.amazonaws.com/comicgeeks/comics/covers/large-6274588.jpg?1559820703'
)
book5.authors << author7

puts "\n**"
puts "* Done Adding #{Book.count} Books"
puts '*'
