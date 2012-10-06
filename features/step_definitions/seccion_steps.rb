require 'rspec/expectations' 

def materium_create
 @create_mate ||= { :codigo => "ISIS-401", :nombre => "Procesos agiles de desarrollo", :maestrium_id => 1 }
 @materia ||= Materium.first conditions: {:codigo => @create_mate[:codigo]}
 @materia.destroy unless @materia.nil?
 @materia = FactoryGirl.create(:materium, codigo: @create_mate[:codigo], nombre: @create_mate[:nombre], maestrium_id: @create_mate[:maestrium_id])
end


def seccion_init
  @seccion = Seccion.new
  @seccion.etiqueta = 'Seccion 1 - Procesos Agiles'
  @seccion.profesor = 'Dario Correal'
  @seccion.salon = 'ML-503' 
  materium_create
  @seccion.materium = @materia
end

def seccion_create
  seccion_init
  visit '/seccions/new'
  select(@create_mate[:codigo] + ' - ' + @create_mate[:nombre], :from => :materium_id) 
  fill_in "Descripcion", :with => @seccion[:etiqueta]
  fill_in "Profesor", :with => @seccion[:profesor]
  fill_in "Salon", :with => @seccion[:salon]
  click_button "Enviar cambios"
end

def seccion_init_2
  @seccion = Seccion.new
  
  @seccion.etiqueta = 'Seccion 2 - Procesos Agiles'
  @seccion.profesor = 'Andres Carvajal'
  @seccion.salon = 'O-401' 
  materium_create
  @seccion.materium = @materia
end

def seccion_create_2
  seccion_init_2
  visit '/seccions/new'
  select(@create_mate[:codigo] + ' - ' + @create_mate[:nombre], :from => :materium_id)
  fill_in "Descripcion", :with => @seccion[:etiqueta]
  fill_in "Profesor", :with => @seccion[:profesor]
  fill_in "Salon", :with => @seccion[:salon]
  click_button "Enviar cambios"
end

def seccion_edit
  select(@create_mate[:codigo] + ' - ' + @create_mate[:nombre], :from => :materium_id)
  fill_in "Descripcion", :with => 'Seccion 2 - Procesos Agiles'
  fill_in "Profesor", :with => 'Jose Abasolo'
  fill_in "Salon", :with => 'ML-202'
  click_button "Enviar cambios"
end



=begin
 El siguiente es la prueba para crear una seccion asociada a una materia 
=end
Given /^I entered to option "Secciones", and selected the "Nueva seccion" option$/ do
  visit '/seccions/'
  visit '/seccions/new'
end

When /^I add the information of the new seccion$/ do
    seccion_create
end

Then /^I should see the information of seccion when the system returns to seccions list$/ do
  visit '/seccions/'
  page.should have_content 'Seccion 1 - Procesos Agiles'
end

=begin
 El siguiente es la prueba para editar una seccion asociada a una materia 
=end
Given /^I entered to option "Secciones", and selected the "Editar" option over a seccion of interest$/ do
  visit '/seccions/'
   seccion_create_2
end

When /^I edit the information of the selected seccion$/ do
    @irA = '/seccions/' + Seccion.all.last.id.to_s + '/edit' 
    visit @irA
    seccion_edit
end

Then /^I should see the updated information of seccion when the system returns to seccion list and I view the seccion information$/ do
  @irA = '/seccions/' + Seccion.all.last.id.to_s
  visit @irA
  page.should have_content 'ML-202'
end

=begin
 El siguiente es la prueba para eliminar una seccion asociada a una materia 
=end
Given /^I entered to option "Secciones", and selected the "Eliminar" option over a seccion of interest$/ do
  visit '/seccions/'
  seccion_create_2
end

When /^I select the "Eliminar" action over the selected seccion$/ do
 Capybara.current_session.driver.delete '/seccions/' + Seccion.all.last.id.to_s
end

Then /^I should not see the information of deleted seccion when the system returns to seccion list$/ do
 visit '/seccions/'
 page.should_not have_content 'Seccion 2 - Procesos Agiles' 
end