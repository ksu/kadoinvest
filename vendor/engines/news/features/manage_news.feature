@news
Feature: News
  In order to have news on my website
  As an administrator
  I want to manage news

  Background:
    Given I am a logged in refinery user
    And I have no news

  @news-list @list
  Scenario: News List
   Given I have news titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of news
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @news-valid @valid
  Scenario: Create Valid New
    When I go to the list of news
    And I follow "Add New New"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 new

  @news-invalid @invalid
  Scenario: Create Invalid New (without title)
    When I go to the list of news
    And I follow "Add New New"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 news

  @news-edit @edit
  Scenario: Edit Existing New
    Given I have news titled "A title"
    When I go to the list of news
    And I follow "Edit this new" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of news
    And I should not see "A title"

  @news-duplicate @duplicate
  Scenario: Create Duplicate New
    Given I only have news titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of news
    And I follow "Add New New"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 news

  @news-delete @delete
  Scenario: Delete New
    Given I only have news titled UniqueTitleOne
    When I go to the list of news
    And I follow "Remove this new forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 news
 