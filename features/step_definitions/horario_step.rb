require 'rspec/expectations' 

def seccion_create
 @create_secc ||= { :materium_id => 1, :etiqueta => "Seccion 4 - Procesos Agiles", :profesor => "Dario Correal", :salon => "ML-201" }
 @seccion ||= Seccion.first conditions: {:etiqueta => @create_secc[:etiqueta]}
 @seccion.destroy unless @seccion.nil?
 @seccion = FactoryGirl.create(:seccion, materium_id: @create_secc[:materium_id], etiqueta: @create_secc[:etiqueta], profesor: @create_secc[:profesor], salon: @create_secc[:salon])
end


def horario_init
  @horario = Horario.new
  @horario.dia = 'Jueves'
  @horario.hora_inicio = Time.new(1900,1,1, 16,00,0) 
  @horario.hora_fin = Time.new(1900,1,1, 18,0,0)  
  seccion_create
  @horario.seccion = @seccion
end

def horario_create
  horario_init
  visit '/horarios/new'
  #select(@create_secc[:etiqueta], :from => :seccion_id) 
  select(@horario[:dia], :from => :dia)
  select_time(@horario[:hora_inicio].to_s, :from => 'Hora inicio')
  select_time(@horario[:hora_fin].to_s, :from => 'Hora fin')
  click_button "Enviar cambios"
end

def horario_init_2
  @horario = Horario.new
  @horario.dia = 'Martes'
  @horario.hora_inicio = Time.new(1600,1,1, 17,00,0) 
  @horario.hora_fin = Time.new(1600,1,1, 19,00,0) 
  seccion_create
  @horario.seccion = @seccion
end

def horario_create_2
  horario_init
  visit '/horarios/new'
  #select(@create_secc[:etiqueta], :from => :seccion_id) 
  select(@horario[:dia], :from => :dia)
  select_time(@horario[:hora_inicio].to_s, :from => 'Hora inicio')
  select_time(@horario[:hora_fin].to_s, :from => 'Hora fin')
  click_button "Enviar cambios"
end

def horario_edit
  #select(@create_secc[:etiqueta], :from => :seccion_id) 
  select("Viernes", :from => :dia)
  select_time(@horario[:hora_inicio].to_s, :from => 'Hora inicio')
  select_time(@horario[:hora_fin].to_s, :from => 'Hora fin')
  click_button "Enviar cambios"
end



=begin
 El siguiente es la prueba para crear un horario asociado a una seccion 
=end
Given /^I entered to option "Horarios", and selected the "Nuevo Horario" option$/ do
  visit '/horarios/'
  visit '/horarios/new'
end

When /^I add the information of the new schedule$/ do
    horario_create
end

Then /^I should see the information of schedule when the system returns to schedules list$/ do
  visit '/horarios/'
  page.should have_content 'Jueves'
end

=begin
 El siguiente es la prueba para editar una seccion asociada a una materia 
=end
Given /^I entered to option "Horarios", and selected the "Editar" option over a schedule of interest$/ do
   visit '/horarios/'
   horario_create_2
end

When /^I edit the information of the selected schedule$/ do
    @irA = '/horarios/' + Horario.all.last.id.to_s + '/edit' 
    visit @irA
    horario_edit
end

Then /^I should see the updated information of schedule when the system returns to schedule list and I view the schedule information$/ do
  @irA = '/horarios/' + Horario.all.last.id.to_s
  visit @irA
  page.should have_content 'Viernes'
end

=begin
 El siguiente es la prueba para eliminar una seccion asociada a una materia 
=end
Given /^I entered to option "Horarios", and selected the "Eliminar" option over a schedule of interest$/ do
  visit '/horarios/'
  horario_create_2
end

When /^I select the "Eliminar" action over the selected schedule$/ do
 Capybara.current_session.driver.delete '/horarios/' + Horario.all.last.id.to_s
end

Then /^I should not see the information of deleted schedule when the system returns to schedule list$/ do
 visit '/horarios/'
 page.should_not have_content 'Martes' 
end
