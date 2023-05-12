10.times do
  User.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    role: ['admin', 'user'].sample,
    password: 'password',
    password_confirmation: 'password'
  )
end

20.times do
  Movie.create(
    title: Faker::Movie.title,
    description: Faker::Movie.quote,
    movie_type: Faker::Movie.genre,
    movie_link: Faker::Internet.url,
    release_date: Faker::Date.between(from: 10.years.ago, to: Date.today),
    movie_icon: Faker::LoremPixel.image(size: "50x50", is_gray: false, category: 'technics', number: rand(1..10)),
    rating: rand(1..5),
    user_id: rand(1..10)
  )
end
