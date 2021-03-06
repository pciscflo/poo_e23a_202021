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
      verificarExistencia(envio.codigoEnvio)
   	  arregloEnvios.push(envio)
   end

   def verificarExistencia(codigo) #retorna true si existe "Peligro!!!"
   	  for envio in arregloEnvios
         if envio.codigoEnvio == codigo
         	raise "Error codigo ya existe!!!" #el origen ya tiene el mensaje al cliente
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

###### Pruebas ########
emar1 = EnvioMaritimo.new("001", 20, 2, "El Farol")
emar2 = EnvioMaritimo.new("002", 10, 3, "La Barca")
eultra1 = EnvioUltramarino.new("002", 30, 4, "EMP2", "Luis Perez")
eultra2 = EnvioUltramarino.new("004", 40, 5, "EMP5", "Juan Perez")
emar3 = EnvioMaritimo.new("002", 10, 3, "La Barca")
jefe = Jefe.new
begin
    jefe.registrar(emar1)
rescue Exception => e 
   puts e.message
end
begin 
  jefe.registrar(emar2)
rescue Exception => e 
   puts e.message
end
begin
  jefe.registrar(eultra1)
rescue Exception => e 
   puts e.message
end
begin
 jefe.registrar(eultra2)
 rescue Exception => e 
   puts e.message
end
begin
   jefe.registrar(emar3) ##aca llega la excepcion
rescue Exception => e 
  puts e.message
end

jefe.imprimirEnviosMaritimos
jefe.imprimirTodos



