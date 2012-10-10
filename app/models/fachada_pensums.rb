class FachadaPensums
  def obtenerMateriasVistasEstudianteAcordePensum(idEstudiante,idMaestria)
     #Se obtiene el estudiante
     @estudiante = Estudiante.find(idEstudiante)
     #Se obtienen las maestrias
     @estudiantepensums = @estudiante.estudiante_pensums
     @estudiantematerias = @estudiante.estudiantemateria
     
     @materiasVistas = {}
     @estudiantepensums.each do |estm|
       if (estm.maestrium.id == idMaestria) then
         #Se obtiene el pensum de la maestria
         @pensum = estm.pensum
         @pensum.tipo_pensums.each do |tipoPensum|
           @materiasTipo =  {}
           @i=0
           @materiasPensum = tipoPensum.materia
           @materiasPensum.each do |materiaPensum|
            @estudiantematerias.each do |estudianteMateria|  
              if (estudianteMateria.materium.id == materiaPensum.id and
                estudianteMateria.estado == 'Vista') then
                @materiasTipo[@i] = materiaPensum 
                @i = @i + 1
              end 
            end
            @materiasVistas[tipoPensum.id] = @materiasTipo
           end
         end
       end
     end
     return @materiasVistas
  end
end