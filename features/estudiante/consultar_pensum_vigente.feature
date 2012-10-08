@active
Feature: Consultar Pensum Vigente
 As a student
 I want to visualize my current pensum
 so I can plan my future semester
 
Background:
Given I am logged in as "gf.moyano131@uniandes.edu.co"
And I belong to "MISIS" masters

Scenario: View my current pensum
	
	When I go to the "MISIS" masters menu
	And I visit the current pensum page
	Then i should see the pensum outline

