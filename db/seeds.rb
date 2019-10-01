# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
[User, Course, Playlist, Video, Photo].each(&:delete_all)
password = "mock_password"
srand(700)
index = 0

100.times do
    index = index + 1
    user = User.create!(
        name: "User #{index}",
        email: Faker::Internet.email,
        bio: Faker::HitchhikersGuideToTheGalaxy.marvin_quote,
        # avatar: Faker::Avatar.image,
        password: password, 
        password_confirmation: password
    )
    # </ courses
    5.times do
    course = Course.create!(
        user_id: user.id,
        title: Faker::Lorem.sentence.titleize,
        # banner: Faker::LoremPixel.image,
        description: Faker::Hacker.say_something_smart,
        price: rand(10),
        created_at: 2.years.ago..Time.now
    )
    # </ playlists
    4.times do
        playlist = Playlist.create!(
        user_id: user.id,
        course_id: course.id,
        title: Faker::Lorem.sentence.titleize,
        # banner: Faker::LoremPixel.image,
        description: Faker::Hipster.sentence,
        created_at: 2.years.ago..Time.now
        )
        # </ videos
        8.times do
        Video.create!(
            user_id: user.id,
            playlist_id: playlist.id,
            title: Faker::Lorem.sentence.titleize,
            # content: Faker::LoremPixel.image,
            description: Faker::HitchhikersGuideToTheGalaxy.quote,
            created_at: 2.years.ago..Time.now
        )
        end
        # videos />
        # </ photos
        8.times do
        Photo.create!(
            user_id: user.id,
            playlist_id: playlist.id,
            title: Faker::Lorem.sentence.titleize,
            # content: Faker::LoremPixel.image,
            description: Faker::HitchhikersGuideToTheGalaxy.quote,
            created_at: 2.years.ago..Time.now
        )
        end
        # photos />
    end
    # playlists />
    end
    # courses />
end
