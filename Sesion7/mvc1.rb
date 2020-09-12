class Alumno
   attr_reader :codigo, :nota1, :nota2
   def initialize(codigo, nota1, nota2)
   	@codigo = codigo
   	@nota1 = nota1
   	@nota2= nota2
   end
   def calcularPromedio
   	(nota1 + nota2)/2.0
   end
end

class Profesor
    attr_reader :alumnos
    def initialize
    	@alumnos= []
    end
    def registrar(codigo, nota1, nota2)
    	alumno = Alumno.new(codigo, nota1, nota2)
        alumnos.push(alumno)
    end
    def calcularPromedioTotal
    	suma = 0
    	for alumno in alumnos
    		suma+=alumno.calcularPromedio
    	end
    	return suma
    end
end

class Controlador
	attr_reader :vistaEntrada, :vistaSalida, :profesor
	def initialize(vistaEntrada, vistaSalida, profesor)
		@vistaEntrada=vistaEntrada
		@vistaSalida=vistaSalida
		@profesor = profesor
	end

	def registrarAlumno
		datos = vistaEntrada.capturarDatosAlumno
		profesor.registrar(datos[0],datos[1], datos[2])
		vistaSalida.mostrarMensaje("Profesor Registrado")
	end


end

class VistaEntrada
    def capturarDatosAlumno
    	datos=[]
    	print("Codigo:")
    	codigo = gets.chomp.to_s
    	print("Nota1:")
    	nota1 = gets.chomp.to_i
    	print("Nota2:")
    	nota2=gets.chomp.to_i
    	datos.push(codigo, nota1, nota2)
    	return datos
    end
end
class VistaSalida
	def mostrarMensaje(mensaje)
        puts mensaje
	end
end

############# Test ##############

vistaSalida = VistaSalida.new
vistaEntrada = VistaEntrada.new
profesor = Profesor.new
controlador = Controlador.new(vistaEntrada, vistaSalida, profesor)
controlador.registrarAlumno
