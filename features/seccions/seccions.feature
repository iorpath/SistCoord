 Feature: Administer Seccions
 	As a coordinator
 	I want to administer seccions of a materium
 	so I can manage the seccions of every materium and select the best fit to assign students to courses 
  
  
   Scenario: I sign in, enter to option "Secciones", enter to option "Crear seccion para materia", and I create the seccion 
      Given I entered to option "Secciones", and selected the "Crear seccion para materia" option
      When I add the information of the new seccion
      Then I should see the information of seccion when the system returns to seccions list
      
   Scenario: I sign in, enter to option "Secciones", and edit an seccion information 
      Given I entered to option "Secciones", and selected the "Editar" option over a seccion of interest
      When I edit the information of the selected seccion
      Then I should see the updated information of seccion when the system returns to seccion list and I view the seccion information

   Scenario: I sign in, enter to option "Secciones", and delete a seccion that hasn't students assigned 
      Given I entered to option "Secciones", and selected the "Eliminar" option over a seccion of interest
      When I select the "Eliminar" action over the selected seccion
      Then I should not see the information of deleted seccion when the system returns to seccion list