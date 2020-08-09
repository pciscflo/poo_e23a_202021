class Cliente
	def initialize(nombre,direccion,dni)
		@nombre = nombre
		@direccion = direccion
		@dni = dni
	end

	def mostrarDatos
		return "Nombre: #{@nombre}\nDirección: #{@direccion}\nDNI: #{@dni}"
	end

end

class Celular
	def initialize(numero,codCiudad,saldo)
		@numero = numero
		@codCiudad = codCiudad
		@saldo = saldo
	end
	def recargarSaldo(monto)
		@saldo = @saldo + monto # nuevo_valor = valor_anterior + recarga
	end

	def mostrarDatos
		return "Número: #{@numero}\nCódigo ciudad: #{@codCiudad}\nSaldo Actual: #{@saldo}"
	end
end
print "Ingresa Ingresa Nombre:"
nombre = gets.chomp.to_s
cliente1 = Cliente.new(nombre,"La Molina - Lima",74048309)
celular1 = Celular.new(972926128,01,20)
puts cliente1.mostrarDatos
puts celular1.mostrarDatos

celular1.recargarSaldo(5)

puts celular1.mostrarDatos