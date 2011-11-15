@newsfeeds
Feature: Newsfeeds
  In order to have newsfeeds on my website
  As an administrator
  I want to manage newsfeeds

  Background:
    Given I am a logged in refinery user
    And I have no newsfeeds

  @newsfeeds-list @list
  Scenario: Newsfeeds List
   Given I have newsfeeds titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of newsfeeds
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @newsfeeds-valid @valid
  Scenario: Create Valid Newsfeed
    When I go to the list of newsfeeds
    And I follow "Add New Newsfeed"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 newsfeed

  @newsfeeds-invalid @invalid
  Scenario: Create Invalid Newsfeed (without title)
    When I go to the list of newsfeeds
    And I follow "Add New Newsfeed"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 newsfeeds

  @newsfeeds-edit @edit
  Scenario: Edit Existing Newsfeed
    Given I have newsfeeds titled "A title"
    When I go to the list of newsfeeds
    And I follow "Edit this newsfeed" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of newsfeeds
    And I should not see "A title"

  @newsfeeds-duplicate @duplicate
  Scenario: Create Duplicate Newsfeed
    Given I only have newsfeeds titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of newsfeeds
    And I follow "Add New Newsfeed"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 newsfeeds

  @newsfeeds-delete @delete
  Scenario: Delete Newsfeed
    Given I only have newsfeeds titled UniqueTitleOne
    When I go to the list of newsfeeds
    And I follow "Remove this newsfeed forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 newsfeeds
 