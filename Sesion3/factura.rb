class Factura
	attr_accessor :numeroFactura, :fecha, :nombre, :direccion
	def initialize(numeroFactura, fecha, nombre, direccion)
        @numeroFactura=numeroFactura
        @fecha=fecha
        @nombre=nombre
        @direccion=direccion
        @arregloDetalles = []  # Array.new
	end
	def adicionarDetalle(detalle) 
      @arregloDetalles.push(detalle)
	end
	def calcularSubTotal
		suma = 0  #acumulador
       for detalle in @arregloDetalles
         suma = suma + detalle.calcularValorVenta
       end
       return suma
	end
	def calcularIGV
		return calcularSubTotal*0.18
	end
	def calcularTotal
		return (calcularIGV + calcularSubTotal)
	end
end
class Detalle
	attr_accessor :id, :cantidad, :descripcion, :precio
	def initialize(id, cantidad, descripcion, precio)
		@id, @cantidad, @descripcion, @precio = id, cantidad, descripcion, precio		
	end
	def calcularValorVenta
        cantidad*precio
	end
end

#test...

fact1 = Factura.new("0001-10", "12/08/2020", "Luis Perez", "Lima 1 Abancay")
detalle1 = Detalle.new(1, 3, "Chompa", 50)
fact1.adicionarDetalle(detalle1)
detalle2 = Detalle.new(2, 2, "Zapatos", 150)
fact1.adicionarDetalle(detalle2)

puts "Numero Factura: #{fact1.numeroFactura}"
puts fact1.calcularSubTotal



