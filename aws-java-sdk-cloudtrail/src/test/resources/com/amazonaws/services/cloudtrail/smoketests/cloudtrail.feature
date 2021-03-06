# language: en
@cloudtrail @client
Feature: AWS CloudTrail

  Scenario: Making a request
    When I call the "DescribeTrails" API
    Then the value at "TrailList" should be a list

  Scenario: Handling errors
    When I attempt to call the "DeleteTrail" API with:
    | Name | faketrail |
    Then I expect the response error code to be "TrailNotFoundException"
    And I expect the response error message to include:
    """
    Unknown trail
    """
