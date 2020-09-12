class Profesor
	attr_accessor :nombre
	def initialize(nombre)
		@nombre = nombre
	end
	def dameTipo

	end
end
class ProfesorAsociado < Profesor
	def initialize(nombre)
		super(nombre)
	end
	def dameTipo
		return "Asociado"
	end
end
class ProfesorContratado  < Profesor
	def initialize(nombre)
		super(nombre)
	end
	def dameTipo
		return "Contratado"
	end
end

class Factoria
	def self.crearObjeto(tipo, *arg)
		case tipo
          when "pa"
          	return ProfesorAsociado.new(arg[0])
          when "pc"
          	return ProfesorContratado.new(arg[0])          		
        end
	end

end

#No es recomendable
p1 = ProfesorContratado.new("Pepe")
puts p1.dameTipo
p2 = ProfesorAsociado.new("Luis")
puts p2.dameTipo
#Usando Factory
q1 = Factoria.crearObjeto("pc","Pepe")
puts q1.dameTipo
q2 = Factoria.crearObjeto("pa", "Luis")
puts q2.dameTipo


