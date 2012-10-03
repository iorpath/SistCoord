Feature: Administer Students
 As a coordinator
 I want to administer students of master degree
 so I can create the student folder with his related information, his photo, the master information and pensum 
 
   Scenario: I sign in, enter to option "Estudiantes", enter to option "Crear estudiante", and I create the student 
      Given I entered to option "Estudiantes", and selected the "Crear estudiante" option
      When I add the information of the new student
      Then I should see the information of student when the system returns to students list

   Scenario: I sign in, enter to option "Estudiantes", and edit an student information 
      Given I entered to option "Estudiantes", and selected the "Editar" option over a student of interest
      When I edit the information of the selected student
      Then I should see the updated information of student when the system returns to students list and I view the student information

   Scenario: I sign in, enter to option "Estudiantes", and delete a student that isn't assigned to a master degree
      Given I entered to option "Estudiantes", and selected the "Eliminar" option over a student of interest
      When I select the "Eliminar" action over the selected student
      Then I should not see the information of deleted student when the system returns to students list