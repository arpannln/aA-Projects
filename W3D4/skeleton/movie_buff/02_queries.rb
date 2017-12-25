def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select(:id, :title, :yr, :score)
    .where(score: (3..5), yr: (1980..1989))
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
    .group(:yr)
    .having('MAX(score) < 8.0')
    .pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
    .select(:id, :name)
    .joins(:movies)
    .where(movies: {title: title })
    .order('ord ASC')
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  # directors = Actor
  #   .joins(:directed_movies)
  #   .pluck(:name)
  #
  # lead_actor = Actor
  #   .joins(:castings)
  #   .where(ord: 1)
  #   .distinct
  #   .pluck(:name)
  # Movie.select(:title).joins(:castings, :director).where('actor.id = movies.director_id AND ord = 1').pluck(:title)
  Movie
    .select('movies.id, movies.title, actors.name')
    .joins(:actors)
    .where('castings.actor_id = director_id')
    .where('castings.ord = 1')



end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor
    .select('actors.id, actors.name, COUNT(castings.ord) AS roles')
    .where.not('castings.ord = 1')
    .joins(:castings)
    .group('actors.id')
    .order('COUNT(castings.ord) DESC')
    .limit(2)
end
