# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyText"
    date_time_start "2016-01-31 18:59:37"
    date_time_end "2016-01-31 18:59:37"
    rsvp_needed false
    tickets_needed false
    anemities "MyString"
  end
end
