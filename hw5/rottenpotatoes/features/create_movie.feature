Feature: create a movie
  As a movie buff
  So that I can create a movie
  I want to add a movie to the database
  
Background: movies in database
 
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add a movie to database
  When I am on the home page
  And I follow "Add new movie"
  Then I should be on the new page
  Then I fill in "Title" with "A New Movie"
  And I select "G" from "Rating"
  And I select "2017" from "movie_release_date_1i"
  And I select "Jan" from "movie_release_date_2i"
  And I select "1" from "movie_release_date_3i"
  And I press "Save Changes"
  Then I should be on the home page
  And I should see "'A New Movie' was successfully created"
  And I should see "2017-01-01"
  
  