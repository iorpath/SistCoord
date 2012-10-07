 Feature: Administer Horarios
 	As a coordinator
 	I want to administer schedule of a seccion
 	so I can define the schedule of every seccion and so, make better choice of students enrolled at materium 
  
  
   Scenario: I sign in, enter to option "Horarios", enter to option "Nuevo Horario", and I create the schedule 
      Given I entered to option "Horarios", and selected the "Nuevo Horario" option
      When I add the information of the new schedule
      Then I should see the information of schedule when the system returns to schedules list
      
   Scenario: I sign in, enter to option "Horarios", and edit an schedule information 
      Given I entered to option "Horarios", and selected the "Editar" option over a schedule of interest
      When I edit the information of the selected schedule
      Then I should see the updated information of schedule when the system returns to schedule list and I view the schedule information

   Scenario: I sign in, enter to option "Horarios", and delete a schedule that hasn't seccions assigned 
      Given I entered to option "Horarios", and selected the "Eliminar" option over a schedule of interest
      When I select the "Eliminar" action over the selected schedule
      Then I should not see the information of deleted schedule when the system returns to schedule list