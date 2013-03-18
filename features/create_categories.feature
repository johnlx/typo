Feature: Create Categories
  As an admin
  In order to organize blog posts
  I want to create and edit categories

  Background:
    Given the blog is set up

    And the following categories exist:
  | name               |
  | Misc               |
  | Interesting Stuff  |

 
  Scenario:
   Given I am logged into the admin panel
   And I go to the new category page
   Then I should see "Categories"
