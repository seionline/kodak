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

Product.create(
  name: {
    en: 'Mug with custom photo',
    sk: 'Hrnček s Vašou fotografiou'
  },
  description: {
    en: 'white or with colored inside',
    sk: 'biely alebo s farebným vnútrom a uškom'
  },
  price: 12.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Mug with custom two photo or panoramatic photo',
    sk: 'Hrnček s Vašou fotografiou dvojfoto alebo panoráma'
  },
  description: {
    en: 'white or with colored inside',
    sk: 'biely alebo s farebným vnútrom a uškom'
  },
  price: 14.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Magic mug',
    sk: 'Magický hrnček'
  },
  description: {
    en: 'The mug is normally dark, but when a hot liquid is poured into it (tea, cocoa, ...)
      it fades and an image, photo, inscription appears.',
    sk: 'Hrnček je normálne tmavý, ale keď sa doň naleje horúca tekutina (čaj, kakao, ...)
       zbledne a objaví sa obrázok, fotografia, nápis.'
  },
  price: 15.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'White t-shirt',
    sk: 'Biele tričko'
  },
  description: {
    en: 'White t-shirt with your photo',
    sk: 'Biele tričko s Vašou fotografiou'
  },
  price: 15.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Puzzle A3 (24x36cm)',
    sk: 'Puzzle A3 (24x36cm)'
  },
  description: {
    en: '252 pieces',
    sk: '252 dielikov'
  },
  price: 16.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Glass mug',
    sk: 'Hrnček sklenený'
  },
  price: 15.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Bib',
    sk: 'Podbradník'
  },
  description: {
    en: 'blue or pink',
    sk: 'modrý alebo ružový'
  },
  price: 12.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Whiskey glass',
    sk: 'Pohár na whiskey'
  },
  description: {
    en: 'matt glass',
    sk: 'sklenený, matný'
  },
  price: 14.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Small Puzzle',
    sk: 'Malé Puzzle'
  },
  description: {
    en: '10x14 cm - 24 pieces',
    sk: '10x14 cm - 24 dielikov'
  },
  price: 5.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Puzzle A5',
    sk: 'Puzzle A5'
  },
  description: {
    en: '60 pieces',
    sk: '60 dielikov'
  },
  price: 7.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Wooden Puzzle',
    sk: 'Puzzle drevené'
  },
  description: {
    en: '30 pieces',
    sk: '30 dielikov'
  },
  price: 15.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Mouse pad',
    sk: 'Podložka pod myš'
  },
  description: {
    en: 'with your photo',
    sk: 's Vašou fotografiou'
  },
  price: 13.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Cup coaster',
    sk: 'Podložka pod pohár'
  },
  description: {
    en: 'with your photo',
    sk: 's Vašou fotografiou'
  },
  price: 4.5,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Plushies',
    sk: 'Plyšové hračky'
  },
  description: {
    en: 'bear, frog, sheep, duck and others',
    sk: 'Medvedík, Žabka, Ovečka, Kačica a daľšie'
  },
  price: 17.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Ceramic oval',
    sk: 'Keramický ovál'
  },
  description: {
    en: 'photo for grave - coloured / black and white',
    sk: 'foto na pomník - farebné / čiernobiele'
  },
  price: 12.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Cussion 40x40 cm',
    sk: 'Vankúš 40x40 cm'
  },
  description: {
    en: 'with your photo',
    sk: 's Vašou fotografiou'
  },
  price: 12.9,
  product_type: :presents
)

Product.create(
  name: {
    en: 'Foto na doklady',
    sk: 'ID photographs'
  },
  price: 8.5,
  description: {
    en: 'Photos measuring 3x3.5 cm (civil card), 3.5x4.5 cm (passport). Photos with white, /
      gray or other background as desired, any dimensions up to 10x15 cm, for visas, indexes or any /
      other IDs - the price includes 4 photos for OP, PAS or 2 for visas, or 1 photo 9x13 or 10x15. /
      Additional 4 photos for the ID card (2 for visas etc.) €3.50. Passport photos from the brought /
      negative or digital photo €8.50 The price also includes a scan of the negative, if simple adjustments are needed /
      digital data',
    sk: 'Fotografie rozmerov 3x3,5 cm (občiansky preukaz), 3,5x4,5 cm (pas). Fotografie s bielym, /
      sivým či iným pozadím podľa priania ľubovoľných rozmerov do 10x15 cm, na víza, indexy či akékoľvek /
      iné preukazy - cena zahŕňa 4 ks fotografií na OP, PAS alebo 2 ks na víza, či 1 ks 9x13 alebo 10x15. /
      Ďalšie 4 ks fotografií na preukaz ( 2 ks na víza a pod) 3,50€. Fotografie na preukaz z prineseného /
      negatívu či digitálnej fotografie 8,50 € Cena zahŕňa aj sken negatívu, či potrebné jednoduché úpravy /
      digitálnych dát.'
  },
  product_type: :photo_id
)

# Create oreders
12.times do
  o = Order.new(
    size: Order::SIZE_OPTIONS.sample,
    amount: rand(1..23),
    surface: Order::SURFACE_OPTIONS.sample, 
    special_requests: ['', 'This is a special request.', 'Another request.'].sample,
    delivery_method: Order::DELIVERY_METHOD_OPTIONS.sample,
    payment_method: Order::PAYMENT_METHOD_OPTIONS.sample,
    status: Order::STATUS.sample
  )

  o.user = User.all[rand(User.count)]
  o.location = Location.all[rand(2)]
  o.save!
end
