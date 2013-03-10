Feature: Merge Articles
  As an admin
  In order to combine articles with similar content
  I want to merge articles

  Background:
    Given the blog is set up

    And the following articles exist:
  | title      | author         | body             |
  | Sample1    | E. Hemingway   | Sample1 Content  |
  | Sample2    | W. Shakespeare | Sample2 Content  |

 
  Scenario:
   Given I am logged into the admin panel
   And I go to the edit_article page for "Sample1"
   Then I should see "Merge Articles"

