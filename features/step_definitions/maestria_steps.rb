require 'rspec/expectations'

def user_create
 @visitor ||= { :name => "Fred Kimby", :email => "fkimby@example.com",
    :password => "corruptusinextremis", :password_confirmation => "corruptusinextremis" }
 @user ||= User.first conditions: {:email => @visitor[:email]}
 @user.destroy unless @user.nil?
 @user = FactoryGirl.create(:user, name: @visitor[:name], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation], email: @visitor[:email])
end

def maestria_init
  @maestria = Maestrium.new
  @maestria.codigo = 'MISI'
  @maestria.nombre = 'Maestria en TI'
  user_create
  @maestria.user = @user   
end

def user_create_2 
 @visitor ||= { :name => "Krusty the clown", :email => "krusty@example.com",
    :password => "clownkrusty", :password_confirmation => "clownkrusty" }
 @user ||= User.first conditions: {:email => @visitor[:email]}
 @user.destroy unless @user.nil?
 @user = FactoryGirl.create(:user, name: @visitor[:name], password: @visitor[:password] , password_confirmation: @visitor[:password_confirmation], email: @visitor[:email])
end

def maestria_init_2
  @maestria = Maestrium.new
  @maestria.codigo = 'MISIS'
  @maestria.nombre = 'Maestria en Ingenieria de Sistemas'
  user_create_2
  @maestria.user = @user   
end

def maestria_create_2
  maestria_init_2 
  visit '/maestria/new'
  fill_in "Codigo", :with => @maestria[:codigo]
  fill_in "Nombre", :with => @maestria[:nombre]
  select(@visitor[:name] + ' - ' + @visitor[:email], :from => :user_id)
  click_button "Crear/editar maestria"
end

def maestria_create
  maestria_init
  visit '/maestria/new'
  fill_in "Codigo", :with => @maestria[:codigo]
  fill_in "Nombre", :with => @maestria[:nombre]
  select(@visitor[:name] + ' - ' + @visitor[:email], :from => :user_id)
  click_button "Crear/editar maestria"  
end

def maestria_edit
  fill_in "Codigo", :with => 'MATI'
  fill_in "Nombre", :with => 'Maestria en Tecnologias'
  select(@visitor[:name] + ' - ' + @visitor[:email], :from => :user_id)
  click_button "Crear/editar maestria"
end

Given /^I entered to option "Maestrias", and selected the "Crear maestria" option$/ do
  visit '/maestria/'
  visit '/maestria/new'  
end

When /^I add the information of the new master program$/ do
  maestria_create
end

Then /^I should see the information of master program when the system returns to master programs list$/ do
  visit '/maestria/'
  page.should have_content 'MISI'
end

Given /^I entered to option "Maestrias", and selected the "Editar" option over a master program of interest$/ do
  visit '/maestria/'
  maestria_create_2
end

When /^I edit the information of the selected master program$/ do
    @irA = '/maestria/' + Maestrium.all.last.id.to_s + '/edit' 
    visit @irA
    maestria_edit
end

Then /^I should see the updated information of master program when the system returns to master programs list and I view the master program information$/ do
  visit '/maestria/'
  page.should have_content 'MATI'
end

Given /^I entered to option "Maestrias", and selected the "Eliminar" option over a master program of interest$/ do
  visit '/maestria/'
  maestria_create_2
end

When /^I select the "Eliminar" action over the selected master program$/ do
  Capybara.current_session.driver.delete '/maestria/' + Maestrium.all.last.id.to_s
end

Then /^I should not see the information of deleted master program when the system returns to master programs list$/ do
  visit '/maestria/'
  page.should_not have_content 'MISIS'
end