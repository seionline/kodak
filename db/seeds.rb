# frozen_string_literal: true

User.create!(
  first_name: 'Hana',
  last_name: 'Harencarova',
  email: 'h@seionline.ch',
  password: 'aaa',
  password_confirmation: 'aaa',
  role: :admin
)

# create staff members
2.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'aaa',
    password_confirmation: 'aaa',
    role: :staff
  )
end

# create customers
streets = %w[Podzahradná Riazanská Rozvodná Búdková Zelená Kvačalova Zámocká Mierová Hraničná Ondrejovova]
cities = %w[Bratislava Nitra Košice Trnava Pezinok Budmerice Żilina Skalka Trenčín]

17.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'aaa',
    password_confirmation: 'aaa',
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    street: "#{streets.sample} #{rand(1..333)}",
    city: cities.sample,
    postcode: rand(11_000..99_876)
  )
end

# Create locations
Location.create!(
  name: 'Kodak Express - CENTRAL',
  email: 'central@kodak.sk',
  phone: '+421 2 5556 9096',
  street: 'Metodova 6',
  city: 'Bratislava',
  postcode: '821 08',
  opening_hours: '10:00 - 21:00',
  description: {
    en: 'Floor -1, opposite to the drug store TETA, next to the optics.',
    sk: 'Na -1 poschodí, oproti Drogérii TETA, vedľa optiky.'
  }
)

Location.create!(
  name: 'Kodak Express - VIVO!',
  email: 'vivo@kodak.sk',
  phone: '+421 905 714 462',
  street: 'Vajnorská ulica 100',
  city: 'Bratislava',
  postcode: '831 04',
  opening_hours: '10:00 - 21:00',
  description: {
    en: 'In the main hall of main entrance: on the right side of stand Minit (if you are coming from a parking lot: \
    on the left side of fresh juices - Frutisimo).',
    sk: 'Vo vstupnej rotunde hlavného vchodu: na pravej strane od stánku Minit (pri príchode z garáže: naľavo od \
    čerstvých štiav - Frutisimo).'
  }
)

# Create Photo Products
PhotoProduct.create(
  name: '9x13',
  price1: 0.33,
  price2: 0.35,
  price3: 0.37,
  order_type: :online_order
)

PhotoProduct.create(
  name: '10x15',
  price1: 0.35,
  price2: 0.37,
  price3: 0.39,
  order_type: :online_order
)

PhotoProduct.create(
  name: '13x18',
  price1: 0.57,
  price2: 0.59,
  price3: 0.65,
  order_type: :online_order
)

PhotoProduct.create(
  name: '9x13',
  price1: 0.40,
  price2: 0.43,
  price3: 0.45,
  order_type: :in_store_order
)

PhotoProduct.create(
  name: '10x15',
  price1: 0.50,
  price2: 0.53,
  price3: 0.55,
  order_type: :in_store_order
)

PhotoProduct.create(
  name: '13x18',
  price1: 0.70,
  price2: 0.73,
  price3: 0.75,
  order_type: :in_store_order
)

# Create Products
Product.create(
  name: {
    en: 'Scanning of film up to 36 images',
    sk: 'Skenovanie kinofilmu do 36 obr'
  },
  description: {
    en: 'Scanning of film in high resolution',
    sk: 'Skenovanie kinofilmu vo vysokom rozlíšení'
  },
  price: 6.9,
  product_type: :scan
)

Product.create(
  name: {
    en: 'Color negative film',
    sk: 'Farebný negatívny kinofilm'
  },
  description: {
    en: 'Development of color negative cine film by process C41',
    sk: 'Vyvolanie farebného negatívneho kinofilmu procesom C41'
  },
  price: 4.9,
  product_type: :film_development
)

Product.create(
  name: {
    en: 'Color negative roll film',
    sk: 'Farebný negatívny zvitkový film'
  },
  description: {
    en: 'Development of color negative roll film by the C41 process',
    sk: 'Vyvolanie farebného negatívneho zvitkového filmu procesom C41'
  },
  price: 6.9,
  product_type: :film_development
)

Product.create(
  name: {
    en: 'Color negative roll film',
    sk: 'Farebný negatívny zvitkový film'
  },
  description: {
    en: 'Development of color negative roll film by the C41 process',
    sk: 'Vyvolanie farebného negatívneho zvitkového filmu procesom C41'
  },
  price: 6.9,
  product_type: :film_development
)

Product.create(
  name: {
    en: 'Puzzle A4',
    sk: 'Puzzle A4'
  },
  description: {
    en: '120/252 pieces',
    sk: '120/252 dielikov'
  },
  price: 9.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Puzzle heart shape',
    sk: 'Puzzle srdiečkové'
  },
  description: {
    en: '73 pieces',
    sk: '73 dielikov'
  },
  price: 9.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'T-shirt black/colored',
    sk: 'Tričko čierne/farebné'
  },
  price: 14.9,
  product_type: :presents
)
