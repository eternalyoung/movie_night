require_relative "lib/film_collection"

films = FilmCollection.from_kinopoisk!

puts "Программа «Фильм на вечер»\n\n"

filmmakers = films.filmmakers

filmmakers.each_with_index do |filmmaker, index|
  puts "#{index + 1}: #{filmmaker}"
end

puts "\nФильм какого режиссера вы хотите сегодня посмотреть?"
number = $stdin.gets.to_i until (1..filmmakers.size).include?(number)

puts <<~SUGGESTION

  И сегодня вечером рекомендую посмотреть:

  #{films.filmmaker_films(filmmakers[number - 1]).sample}
SUGGESTION
