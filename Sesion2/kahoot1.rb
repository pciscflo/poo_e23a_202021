class Conejo
  def initialize(codigo, nombre, raza, color, edad, precio)
  	@codigo = codigo
  	@nombre = nombre
  	@raza  = raza
  	@color = color
  	@edad = edad
  	@precio = precio
  end
  def calcularFactor
  	 case @color
	  	 when "Blanco"
	  	 	if @edad>=5
	  	 		factor = 10
	  	 	else
	  	 		factor = 20
	  	 	end
	  	 when "Negro"
	  	 	if @edad>=5
	  	 		factor = 8
	  	 	else
	  	 		factor = 12
	  	 	end
  	 end
  end

  def calcularPrecioFinal
  	calcularFactor*@precio
  end
end
conejo = Conejo.new("001", "Nino", "Angora", "Negro", 2, 100)
puts conejo.calcularPrecioFinal





