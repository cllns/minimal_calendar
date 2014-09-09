# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).

Event.delete_all

# What goes at the end of the Location
suffixes = ["Books", "Book Store", "Bookstore", "Booksellers"]
locations = Array.new(5) do |_i|
  Faker::Name.last_name + " " + suffixes.sample
end

# This is how we get the subtitle.
# We construct it from 1..3 (number_of_items_in_subtitle) items randomly
def get_subtitle
  number_of_items_in_subtitle = rand(1..3)

  subtitle = Faker::Commerce.product_name

  if number_of_items_in_subtitle > 1
    subtitle += " and " + Faker::Commerce.product_name
  end
  if number_of_items_in_subtitle > 2
    subtitle.prepend Faker::Commerce.product_name + ", "
  end

  subtitle
end

def get_title
  # weight it so:
  #   40% chance of 1 name,
  #   30% chance of 2 names,
  #   20% chance of 3 names, and
  #   10% chance of 4 names
  number_of_items_in_title = [1, 1, 1, 1, 2, 2, 2, 3, 3, 4].sample

  # Make an array of 4 random items, since that's our max
  items = Array.new(4) do
    Faker::Name.name
  end

  # Select how many we want from those 4 chosen
  items.sample(number_of_items_in_title).join(", ")
end

15.times do |_i|
  # get a random date up to 45 days into the future
  date = Date.today + (10 * rand)

  Event.create(
    title: get_title,
    subtitle: get_subtitle,
    location: locations.sample,
    start: Time.new(date.year, date.month, date.day, 19),
    end: nil,
    url: Faker::Internet.url("example.com")
  )
end
