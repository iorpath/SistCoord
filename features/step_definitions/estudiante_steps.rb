require 'rspec/expectations' 

def user_create
 @visitor ||= { :name => "Bartholomew J. Simpson", :email => "bart@example.com",
    :password => "please", :password_confirmation => "please" }
 @user ||= User.first conditions: {:email => @visitor[:email]}
 @user.destroy unless @user.nil?
 @user = FactoryGirl.create(:user, email: @visitor[:email])
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
  #fill_in :user_id, :with => @estudiante[:user_id]
  #fill_in "Foto", :with => @estudiante[:foto]
  fill_in "Direccion", :with => @estudiante[:direccion]
  fill_in "Tipo estudiante", :with => @estudiante[:tipo_estudiante]
  fill_in "Documento", :with => @estudiante[:documento]
  fill_in "Tipo documento", :with => @estudiante[:tipo_documento]
  click_button "Crear/editar estudiante"
end

def estudiante_edit
  pending
end

Given /^I entered to option "Estudiantes", and selected the "(.*?)" option over a student of interest$/ do |operacion|
  visit '/estudiantes/'
  if (operacion == "Ver informacion") then
    
  else if (operacion == "Editar") then
    estudiante_create
    @idUltimo = Estudiante.all.last.id
    @irA = '/estudiantes/#{@idUltimo}/edit' 
    #TODO QUEDE AQUI... VER COMO PASAR ESE ID FEO
    visit @irA
    estudiante_edit
  end
end

When /^I edit the information of the selected student$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the updated information of student when the system returns to students list$/ do
  pending # express the regexp above with the code you wish you had
end


end