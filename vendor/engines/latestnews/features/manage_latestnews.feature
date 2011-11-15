@latestnews
Feature: Latestnews
  In order to have latestnews on my website
  As an administrator
  I want to manage latestnews

  Background:
    Given I am a logged in refinery user
    And I have no latestnews

  @latestnews-list @list
  Scenario: Latestnews List
   Given I have latestnews titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of latestnews
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @latestnews-valid @valid
  Scenario: Create Valid Latestnew
    When I go to the list of latestnews
    And I follow "Add New Latestnew"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 latestnew

  @latestnews-invalid @invalid
  Scenario: Create Invalid Latestnew (without title)
    When I go to the list of latestnews
    And I follow "Add New Latestnew"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 latestnews

  @latestnews-edit @edit
  Scenario: Edit Existing Latestnew
    Given I have latestnews titled "A title"
    When I go to the list of latestnews
    And I follow "Edit this latestnew" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of latestnews
    And I should not see "A title"

  @latestnews-duplicate @duplicate
  Scenario: Create Duplicate Latestnew
    Given I only have latestnews titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of latestnews
    And I follow "Add New Latestnew"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 latestnews

  @latestnews-delete @delete
  Scenario: Delete Latestnew
    Given I only have latestnews titled UniqueTitleOne
    When I go to the list of latestnews
    And I follow "Remove this latestnew forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 latestnews
 