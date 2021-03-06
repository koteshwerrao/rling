Feature: User detail setting Page
 
  Background:
    When I go to first user page
    And I fill in "user_login" with "amit"
    And I fill in "user_email" with "amit@heurion.com"
    And I fill in "user_password" with "test123"
    And I fill in "user_password_confirmation" with "test123"
    And I fill in "site_url" with "http://localhost:3000"
    And I press "Create Rling First User"
    Then I should be on login page
    And I fill in "login" with "amit"
    And I fill in "password" with "test123"
    And I press "Login"
    Then I should see "Login successful!" on the page

  Scenario: Create a new User Detail Setting page successfully
    Given I go to new user_detail_setting page
    And I fill in "user_detail_setting_field_name" with "Name"
    And I select "Textfield" from "user_detail_setting_field_type"
    And I fill in "user_detail_setting_default_value" with "amit"
    And I check "user_detail_setting_mandatory"
    When I press "Create User detail setting"
    Then I should see "Name"
    And I should see "Textfield"
    And I should see "amit"
    And I should see "true"

  Scenario: Error in Creating new User_detail_setting( Field name is blank)
    Given I go to new user_detail_setting page
    When I press "Create User detail setting"
    Then I should see "can't be blank" for "Field name" on that user detail setting page
    Then I should see "is invalid" for "Field name" on that user detail setting page
    Then I should see "is too short (minimum is 3 characters)" for "Field name" on that user detail setting page

  Scenario: Error in Creating new User_detail_setting( Field name lenght is less than 3 characters )
    Given I go to new user_detail_setting page
    And I fill in "user_detail_setting_field_name" with "na"
    When I press "Create User detail setting"
    Then I should see "is too short (minimum is 3 characters)" for "Field name" on that user detail setting page

  Scenario: Error in Creating new User_detail_setting( Field name is invalid)
    Given I go to new user_detail_setting page
    And I fill in "user_detail_setting_field_name" with ",.ts"
    When I press "Create User detail setting"
    Then I should see "is invalid" for "Field name" on that user detail setting page
  
  Scenario: User Detail Settings Index Page
    Given I have a user detail setting on the index page
    Given I go to user_detail_setting index page
    Then I should see "Name" on user detail settings page
    And I should see "Textfield" on user detail settings page
    And I should see "true" on user detail settings page

  Scenario: User clicks on Show Page
    Given I have a user detail setting on the index page
    Given I go to user_detail_setting index page
    When I press "Show" for the "Name" on the page
    Then I should see "Name" for "Field Name" on the user detail setting show page
    And I should see "Textfield" for "Field Type" on the user detail setting show page
    And I should see "amit" for "Default Value" on the user detail setting show page
    And I should see "true" for "Is this field mandatory for users" on the user detail setting show page

  Scenario: Edit a User detail setting item
    Given I have a user detail setting on the index page
    Given I go to user_detail_setting index page 
    When I press "Edit" for the "Name" on the page
    Then I should see "Edit Field Setting Name " on the edit user_detail_setting page 
    And I fill in "user_detail_setting_field_name" with "Name"
    And I select "Textfield" from "user_detail_setting_field_type"
    And I fill in "user_detail_setting_default_value" with "amit"
    And I check "user_detail_setting_mandatory"
    When I press "Update User detail setting"
    Then I should see "Name"
    And I should see "Textfield"
    And I should see "amit"
    And I should see "true"

  Scenario: Delete an item from user detail setting page
    Given I have a user detail setting on the index page
    Given I go to user_detail_setting index page
    Then I should see "Name" on the index page
    When I press "Delete" for the "Name" on the page
    Then I should not see "Name" on the index page

  Scenario: Update position of user detail setting
    Given I have a user detail setting on the index page
    Given I go to user_detail_setting index page
    And I fill in "1" with "3"
    When I press "Update Positions"
    Then the user detail setting position should be updated.

 
