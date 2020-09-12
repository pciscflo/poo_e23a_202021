class Envio
	attr_reader :codigoEnvio, :volumenMetrico, :categoriaEnvio
	def initialize(codigoEnvio, volumenMetrico, categoriaEnvio)
		@codigoEnvio=codigoEnvio
		@volumenMetrico=volumenMetrico
		@categoriaEnvio=categoriaEnvio
	end
	def calcularCosto
	end
	def dameTipo
	end
end
class EnvioMaritimo < Envio
	attr_reader :razonSocial
	def initialize(codigoEnvio, volumenMetrico, categoriaEnvio, razonSocial)
		super(codigoEnvio, volumenMetrico, categoriaEnvio)
		@razonSocial = razonSocial
	end
	def calcularCosto
		volumenMetrico*100 + (volumenMetrico*categoriaEnvio)*25
	end
	def dameTipo
		"EnvioMaritimo"
	end

end
class EnvioUltramarino < Envio 
	attr_reader :codigoEmpresa, :nombreRepresentante
	def initialize(codigoEnvio, volumenMetrico, categoriaEnvio, codigoEmpresa, nombreRepresentante)
		super(codigoEnvio, volumenMetrico, categoriaEnvio)
		@codigoEmpresa=codigoEmpresa
		@nombreRepresentante = nombreRepresentante
	end
    def calcularCosto
		volumenMetrico*500 + (volumenMetrico*10)*categoriaEnvio*10
	end
	def dameTipo
		"EnvioUltramarino"
	end
end

class Jefe
   attr_reader :arregloEnvios

   def initialize
   	  @arregloEnvios = []
   end

   def registrar(envio)
   	#verificar si el codigo de envio existe....
      if verificarExistencia(envio.codigoEnvio) == false
   	      arregloEnvios.push(envio)
   	      puts "Codigo registrado: #{envio.codigoEnvio}"
   	  else
   	  	puts "Codigo ya existe #{envio.codigoEnvio}"
   	  end
   end

   def verificarExistencia(codigo) #retorna true si existe
   	  for envio in arregloEnvios
         if envio.codigoEnvio == codigo
         	return true
         end
   	  end
   	  return false
   end

   def imprimirEnviosMaritimos
   	   puts "Envios Maritimos **************"
       for envio in arregloEnvios
          if  envio.dameTipo == "EnvioMaritimo"
          	puts "#{envio.codigoEnvio}  .... #{envio.razonSocial}"
          end
       end
   end
   def imprimirTodos
   	 puts "Envios Todos **********"
   	 for envio in arregloEnvios
          if  envio.dameTipo == "EnvioMaritimo"
          	puts "#{envio.codigoEnvio}  .... #{envio.razonSocial}"
          else
          	puts "#{envio.codigoEnvio}  ....#{envio.codigoEmpresa}   #{envio.nombreRepresentante}"
          end
       end
   end
end
class Factoria
   def self.create(tipo, *arg)
    case tipo
     when "m"
      EnvioMaritimo.new(arg[0],arg[1],arg[2],arg[3])
     when "U"
      EnvioUltramarino.new(arg[0],arg[1],arg[2],arg[3],arg[4])        
     end
   end
end

puts "Factoria"
emar1 = Factoria.create("m","001", 20, 2, "El Farol")
emar2 = Factoria.create("m","002", 10, 3, "La Barca")
eultra1 = Factoria.create("U","003", 30, 4, "EMP2", "Luis Perez")
eultra2 = Factoria.create("U","004", 40, 5, "EMP5", "Juan Perez")
emar3 = Factoria.create("m", "002", 10, 3, "La Barca")
###### Pruebas ########
jefe = Jefe.new
jefe.registrar(emar1)
jefe.registrar(emar2)
jefe.registrar(eultra1)
jefe.registrar(eultra2)
jefe.registrar(emar3)
jefe.imprimirEnviosMaritimos
jefe.imprimirTodos



