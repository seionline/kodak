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
