require 'rspec/expectations'

def user_create
 @visitor ||= { :name => "Mr. Burns", :email => "mrburns@example.com",
    :password => "mrburns", :password_confirmation => "mrburns" }
 @user ||= User.first conditions: {:email => @visitor[:email]}
 @user.destroy unless @user.nil?
 @user = FactoryGirl.create(:user, name: @visitor[:name], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation], email: @visitor[:email])
end

def maestria_create
  @maestria1 = Maestrium.new
  @maestria1.codigo = 'MISI'
  @maestria1.nombre = 'Maestria en TI'
  user_create
  @maestria1.user = @user
  @maestria = FactoryGirl.create(:maestrium, codigo: @maestria1[:codigo], user: @user, nombre: @maestria1[:nombre])   
end

def materia_init
  @materia = Materium.new
  @materia.codigo = 'MISI-4000'
  @materia.nombre = 'Tutorial especial I'
  maestria_create
  @materia.maestrium = @maestria   
end


def materia_create
  materia_init
  visit '/materia/new'
  fill_in "Codigo", :with => @materia[:codigo]
  fill_in "Nombre", :with => @materia[:nombre]
  select(@maestria[:codigo] + ' - ' + @maestria[:nombre], :from => :maestrium_id)
  click_button "Crear/editar materia"  
end

def materia_init_2
  @materia = Materium.new
  @materia.codigo = 'MISI-4005'
  @materia.nombre = 'Diseno de lenguajes'
  maestria_create
  @materia.maestrium = @maestria   
end


def materia_create_2
  materia_init_2
  visit '/materia/new'
  fill_in "Codigo", :with => @materia[:codigo]
  fill_in "Nombre", :with => @materia[:nombre]
  select(@maestria[:codigo] + ' - ' + @maestria[:nombre], :from => :maestrium_id)
  click_button "Crear/editar materia"  
end

def materia_edit
  fill_in "Codigo", :with => 'MISI-4001A'
  fill_in "Nombre", :with => 'Tesis I Con Honores'
  select(@maestria[:codigo] + ' - ' + @maestria[:nombre], :from => :maestrium_id)
  click_button "Crear/editar materia"
end

Given /^I entered to option "Materias", and selected the "Crear materia" option$/ do
  visit '/materia/'
  visit '/materia/new'  
end

When /^I add the information of the new course$/ do
  materia_create
end

Then /^I should see the information of course when the system returns to the courses list$/ do
  visit '/materia/'
  page.should have_content 'MISI-4000'  
end

Given /^I entered to option "Materias", and selected the "Editar" option over a course of interest$/ do
  visit '/materia/'
  materia_create_2
end

When /^I edit the information of the selected course$/ do
  @irA = '/materia/' + Materium.all.last.id.to_s + '/edit' 
  visit @irA
  materia_edit  
end

Then /^I should see the updated information of the course when the system returns to courses list and I view the course information$/ do
  visit '/materia/'
  page.should have_content 'MISI-4001A'
end

Given /^I entered to option "Materias", and selected the "Eliminar" option over a course of interest$/ do
  visit '/materia/'
  materia_create_2
end  

When /^I select the "Eliminar" action over the selected course$/ do
 Capybara.current_session.driver.delete '/materia/' + Materium.all.last.id.to_s
end

Then /^I should not see the information of deleted course when the system returns to courses list$/ do
  visit '/materia/'
  page.should_not have_content 'MISI-4005'
end