Feature: Administer Courses
 As a coordinator
 I want to administer the associated information of courses
 so I have the courses information always up-to-date 
 
   Scenario: I sign in, enter to option "Materias", enter to option "Crear materia", and I create the course
      Given I entered to option "Materias", and selected the "Crear materia" option
      When I add the information of the new course
      Then I should see the information of course when the system returns to the courses list

   Scenario: I sign in, enter to option "Materias", and edit a course information 
      Given I entered to option "Materias", and selected the "Editar" option over a course of interest
      When I edit the information of the selected course
      Then I should see the updated information of the course when the system returns to courses list and I view the course information

   Scenario: I sign in, enter to option "Materias", and delete a course that I create recently
      Given I entered to option "Materias", and selected the "Eliminar" option over a course of interest
      When I select the "Eliminar" action over the selected course
      Then I should not see the information of deleted course when the system returns to courses list