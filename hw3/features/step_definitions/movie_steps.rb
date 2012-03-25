# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|

  count = 0

  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.

    count += 1

    Movie.create!(movie)
  end

  puts "Added #{count} movies"



  #assert false, "Unimplmemented"
end

Then /^I should see all of the movies/ do
  Movie.select(:title).each do |t|
    step %Q{I should see "#{t.title}"}
  end
end

Then /^I should see none of the movies/ do
  Movie.select(:title).each do |t|
    step %Q{I should not see "#{t.title}"}
  end
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.

  #page.body =~ Regexp.new("#{e1}.+#{e2}")
  #puts find("table#movies").text

  pos1 = nil
  pos2 = nil

  #puts all("table#movies > tbody > tr").methods.inspect
  all("table#movies > tbody > tr").each_with_index do |tr, index|
    t = tr.first('td').text
    pos1 = index if t.index(e1) and not pos1
    pos2 = index if t.index(e2) and not pos2
  end

  assert pos1, "Movie #{e1} was not found"
  assert pos2, "Movie #{e2} was not found"

  #puts "#{pos1} < #{pos2}"

  assert pos1 < pos2, "Movie #{e1} is not before #{e2}"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings:\s*(.*)\s*$/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(/\s*,\s*/).each do |r|
    if r =~ /.+/ then
      if uncheck then
        step %Q{I uncheck "ratings_#{r}"}
      else
        step %Q{I check "ratings_#{r}"}
      end
    end
  end
end
