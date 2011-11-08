@operations
Feature: Operations
  In order to have operations on my website
  As an administrator
  I want to manage operations

  Background:
    Given I am a logged in refinery user
    And I have no operations

  @operations-list @list
  Scenario: Operations List
   Given I have operations titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of operations
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @operations-valid @valid
  Scenario: Create Valid Operation
    When I go to the list of operations
    And I follow "Add New Operation"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 operation

  @operations-invalid @invalid
  Scenario: Create Invalid Operation (without title)
    When I go to the list of operations
    And I follow "Add New Operation"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 operations

  @operations-edit @edit
  Scenario: Edit Existing Operation
    Given I have operations titled "A title"
    When I go to the list of operations
    And I follow "Edit this operation" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of operations
    And I should not see "A title"

  @operations-duplicate @duplicate
  Scenario: Create Duplicate Operation
    Given I only have operations titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of operations
    And I follow "Add New Operation"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 operations

  @operations-delete @delete
  Scenario: Delete Operation
    Given I only have operations titled UniqueTitleOne
    When I go to the list of operations
    And I follow "Remove this operation forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 operations
 