require 'rspec/expectations' 

def user_create
 @visitor ||= { :name => "Homer J. Simpson", :email => "homero@example.com",
    :password => "dohmyfriend", :password_confirmation => "dohmyfriend" }
 @user ||= User.first conditions: {:email => @visitor[:email]}
 @user.destroy unless @user.nil?
 @user = FactoryGirl.create(:user, name: @visitor[:name], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation], email: @visitor[:email])
end

def estudiante_init
  @estudiante = Estudiante.new
  @estudiante.direccion = 'Calle 89 No. 24-56'
  @estudiante.documento = '33445566'
  @estudiante.foto = '/uploads/estudiante/foto/1/student.png'
  @estudiante.telefono = '2234433' 
  @estudiante.tipo_documento = 'CC'
  @estudiante.tipo_estudiante = 'Maestria'
  user_create
  @estudiante.user = @user   
end


Given /^I am logged in as "(.*?)"$/ do |email|
  estudiante_init
  @estudiante.user.email = email
  visit '/users/sign_in'
  fill_in "Email", :with => @estudiante.user.email
  fill_in "Password", :with => @estudiante.user.email
  click_button "Sign in"
end

Given /^I belong to "(.*?)" masters$/ do |arg1|
 @maestria = FactoryGirl.create :maestria_con_materias
 @maestria.user = @estudiante.user
end

When /^I go to the "(.*?)" masters menu$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I visit the current pensum page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^i should see the pensum outline$/ do
  pending # express the regexp above with the code you wish you had
end
