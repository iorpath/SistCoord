class FachadaPensums
  def obtenerMateriasVistasEstudianteAcordePensum(idEstudiante,idMaestria)
     #Se obtiene el estudiante
     @estudiante = Estudiante.find(idEstudiante)
     #Se obtienen las maestrias
     @estudiantemaestrias = @estudiante.estudiantemaestrias
     @estudiantematerias = @estudiante.estudiantematerias
     
     @materiasVistas = {}
     @estudiantemaestrias.each do |estm|
       if (estm.maestria.id == idMaestria) then
         #Se obtiene el pensum de la maestria
         @pensum = estm.pensum
         @pensum.tipo_pensums.each do |tipoPensum|
           @materiasTipo =  {}
           @i=0
           @materiasPensum = tipoPensum.materias
           @materiasPensum.each do |materiaPensum|
            @estudiantematerias.each do |estudianteMateria|  
              if (estudianteMateria.materia.id == materiaPensum.id and
                estudianteMateria.estado == 'Aprobada') then
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