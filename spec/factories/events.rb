# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "Members Montly Hangout"
    description "This is when our fabulous members get to hangout every month. There may be some new faces to meet!"
    date_time_start "2016-02-01 18:00:00"
    date_time_end "2016-02-01 20:00:00"
    rsvp_needed false
    tickets_needed false
    amenities "Food and Wine"
    location_name "Coit Tower"
    location_address "1 Telegraph Hill Blvd, San Francisco, CA"
  end
end
