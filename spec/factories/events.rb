# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do

    name {Faker::Hacker.adjective.capitalize + " " + Faker::Hacker.abbreviation.capitalize + " " + Faker::Hacker.noun.capitalize + " " + ["Evening", "Night", "Symposium", "Conference", "Meetup", "Day", "Challenge", "Party", "Tutorial", "Hangout"].sample}

    description {Faker::Hacker.say_something_smart.downcase.split(" ").zip(\
        (Faker::Company.catch_phrase+" "+Faker::Company.bs).downcase.split(" ")\
        ).flatten(1).compact.join(" ").capitalize}

    date_time_start {[Faker::Date.forward(200), Faker::Date.backward(60)].sample + (rand(48)/2).hours}

    date_time_end {date_time_start+ (rand(16)/2+0.5).hours}

    rsvp_needed {[true, false].sample}

    tickets_needed {[true, false].sample}

    amenities {([Faker::Commerce.product_name, 
        Faker::Commerce.product_name, 
        Faker::Commerce.product_name,
         Faker::Commerce.product_name][0,rand(4)+1]).join(", ")}

    location_name {Faker::Company.name}

    location_address {Faker::Address.street_address + ", " + Faker::Address.city}
  end
end
