class Profesor
  attr_accessor :codigo, :dni, :nombre
  def initialize(codigo, dni, nombre)
  	@codigo=codigo
  	@dni=dni
  	@nombre=nombre
  end
  def calcularSueldoNeto
  end
end
class ProfesorTP < Profesor
	attr_accessor :horas, :tarifa
	def initialize(codigo, dni, nombre, horas, tarifa)
		super(codigo, dni, nombre)
		@horas = horas
		@tarifa = tarifa
	end
	def calcularSueldoNeto
		horas*tarifa
    end
end
class ProfesorTC < Profesor
   attr_accessor :sueldoFijo, :porcAfp
   def initialize(codigo, dni, nombre, sueldoFijo, porcAfp)
   	 super(codigo, dni, nombre)
   	 @sueldoFijo= sueldoFijo
   	 @porcAfp = porcAfp
   end
   def calcularSueldoNeto
		sueldoFijo - porcAfp*sueldoFijo
    end
end

ptp1 = ProfesorTP.new("2001", "888888888", "Luis", 20, 40)
ptc1 = ProfesorTC.new("2003", "99999999", "Juan", 2400, 0.11)

puts "Nombre: #{ptp1.nombre} tiene un sueldo neto: #{ptp1.calcularSueldoNeto}"
puts "Nombre: #{ptc1.nombre} tiene un sueldo neto: #{ptc1.calcularSueldoNeto}"

