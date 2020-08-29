=begin
Una empresa desea calcular el sueldo a pagar a un grupo de trabajadores.
Los trabajadores pueden ser de dos tipos: Fijos o Contratados. 
En el caso de los Contratados el sueldo se calcula mediante la fórmula:
Horas Trabajadas * Precio por Hora. 
En el caso de los Asociados el sueldo se le calcular:
Horas Trabajadas * Precio por Hora + bono de 100 soles
1) El administrador deberá presentar el total de los sueldos a pagar.
2) El promedio de sueldos de los trabajadores Contratados
3) Los datos del trabajador que gana más, considerar que no hay empates.
=end
class Trabajador
  attr_accessor :nombre, :tipo, :horaTrabajadas, :precioHora
  def initialize(nombre, tipo, horaTrabajadas, precioHora)
  	@nombre=nombre
  	@tipo = tipo
  	@horaTrabajadas=horaTrabajadas
  	@precioHora=precioHora
  end
  def calcularSueldo
  	case tipo
  	    when "Contratado"  		
  	  		sueldo = horaTrabajadas*precioHora
  	  	when "Asociado"
  	  		sueldo = horaTrabajadas*precioHora + 100 	  			
  	 end
  	 return sueldo
  end

end
class Administrador
	attr_accessor :nombre, :arregloTrabajadores
  def initialize(nombre)
  	@arregloTrabajadores = []
  end
  def registrar(trabajador)
  	arregloTrabajadores.push(trabajador)
  end
  def calcularSumaSueldos
  	suma = 0
  	for trabajador in arregloTrabajadores
  		suma = suma + trabajador.calcularSueldo
  	end
  	return suma
  end
  def obtenerTrabajadorGanaMas
  	maximo = 0
  	ganador = nil
  	for trabajador in arregloTrabajadores
  		if trabajador.calcularSueldo>maximo
  			maximo = trabajador.calcularSueldo
  			ganador = trabajador
  		end
  	end
  	return ganador
  end
  def imprimirListado
    puts "***** LIstado ***********"
     for trabajador in arregloTrabajadores
       puts "#{trabajador.nombre}  #{trabajador.calcularSueldo}"
     end
  end
  def obtenerListadoGanan1200
     tempo =[]
     for trabajador in arregloTrabajadores
      if trabajador.calcularSueldo > 1200
       tempo.push(trabajador)
      end
     end
     return tempo
  end
  def imprimirListadoGanamas1200
     puts "***** LIstado de los que ganan mas de 1200 ***********"
     for trabajador in arregloTrabajadores
      if trabajador.calcularSueldo > 1200
       puts "#{trabajador.nombre}  #{trabajador.calcularSueldo}"
      end
     end
  end
end
#test
t1 = Trabajador.new("Pepe","Contratado",20, 50)
t2 = Trabajador.new("Carlos","Contratado",30, 40)
t3 = Trabajador.new("Jaime","Asociado",25, 60)
administrador = Administrador.new("Jose")
administrador.registrar(t1)
administrador.registrar(t2)
administrador.registrar(t3)
puts "*********** Reporte de Sueldos ***********"
for p in administrador.arregloTrabajadores
	puts "#{p.nombre}   #{p.calcularSueldo}"
end
puts "******************************************"
puts "Suma de sueldos: #{administrador.calcularSumaSueldos}"
ganador =  administrador.obtenerTrabajadorGanaMas
puts "Quien gana mas: #{ganador.nombre} cuyo sueldo es #{ganador.calcularSueldo}"
puts "*************************************"
administrador.imprimirListado
administrador.imprimirListadoGanamas1200
arreglo = administrador.obtenerListadoGanan1200
puts "*********** Reporte de Los que ganan ms de 1200 ***********"
for p in arreglo
  puts "#{p.nombre}   #{p.calcularSueldo}"
end
