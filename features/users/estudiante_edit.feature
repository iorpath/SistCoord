Feature: Edit Student
  As a coordinator
  I want to edit the student information
  so I can keep the information of the student up to date

    Scenario: I sign in, enter to option "Estudiantes", and edit an student information 
      Given I entered to option "Estudiantes", and selected the "Editar" option over a student of interest
      When I edit the information of the selected student
      Then I should see the updated information of student when the system returns to students list
