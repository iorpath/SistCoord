require 'rspec/expectations' 

def user_create
 @visitor ||= { :name => "Bartholomew J. Simpson", :email => "bart@example.com",
    :password => "please", :password_confirmation => "please" }
 @user ||= User.first conditions: {:email => @visitor[:email]}
 @user.destroy unless @user.nil?
 @user = FactoryGirl.create(:user, name: @visitor[:name], password: @visitor[:password] ,email: @visitor[:email])
end

def estudiante_init
  @estudiante = Estudiante.new
  @estudiante.direccion = 'Calle 85 No. 21-12'
  @estudiante.documento = '99887766'
  @estudiante.foto = '/uploads/estudiante/foto/1/student.png'
  @estudiante.telefono = '3575757' 
  @estudiante.tipo_documento = 'CC'
  @estudiante.tipo_estudiante = 'Maestria'
  user_create
  @estudiante.user = @user   
end

def estudiante_create
  estudiante_init
  visit '/estudiantes/new'
  select(@visitor[:name] + ' - ' + @visitor[:email], :from => :user_id) 
  #fill_in "Foto", :with => @estudiante[:foto]
  fill_in "Direccion", :with => @estudiante[:direccion]
  fill_in "Tipo estudiante", :with => @estudiante[:tipo_estudiante]
  fill_in "Documento", :with => @estudiante[:documento]
  fill_in "Tipo documento", :with => @estudiante[:tipo_documento]
  click_button "Crear/editar estudiante"
end

def estudiante_edit
  select(@visitor[:name] + ' - ' + @visitor[:email], :from => :user_id) 
  #fill_in "Foto", :with => @estudiante[:foto]
  fill_in "Direccion", :with => 'Calle especial No. 34-11'
  fill_in "Tipo estudiante", :with => 'Maestria y Doctorado'
  fill_in "Documento", :with => 'AN3828273'
  fill_in "Tipo documento", :with => 'P'
  click_button "Crear/editar estudiante"
end

Given /^I entered to option "Estudiantes", and selected the "Editar" option over a student of interest$/ do
  visit '/estudiantes/'
   estudiante_create
end

When /^I edit the information of the selected student$/ do
    @irA = '/estudiantes/' + Estudiante.all.last.id.to_s + '/edit' 
    visit @irA
    estudiante_edit
end

Then /^I should see the updated information of student when the system returns to students list and I view the student information$/ do
  @irA = '/estudiantes/' + Estudiante.all.last.id.to_s
  visit @irA
  page.should have_content 'AN3828273'
end