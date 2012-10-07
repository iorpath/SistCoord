Feature: Administer Master Programs
 As a coordinator
 I want to administer the associated information of master programs
 so I have the master programs information always up-to-date 
 
   Scenario: I sign in, enter to option "Maestrias", enter to option "Crear maestria", and I create the master program
      Given I entered to option "Maestrias", and selected the "Crear maestria" option
      When I add the information of the new master program
      Then I should see the information of master program when the system returns to master programs list

   Scenario: I sign in, enter to option "Maestrias", and edit a master program information 
      Given I entered to option "Maestrias", and selected the "Editar" option over a master program of interest
      When I edit the information of the selected master program
      Then I should see the updated information of master program when the system returns to master programs list and I view the master program information

   Scenario: I sign in, enter to option "Maestrias", and delete a master program that I create recently
      Given I entered to option "Maestrias", and selected the "Eliminar" option over a master program of interest
      When I select the "Eliminar" action over the selected master program
      Then I should not see the information of deleted master program when the system returns to master programs list