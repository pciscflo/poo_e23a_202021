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
   	      return "Codigo registrado: #{envio.codigoEnvio}"
   	  else
   	  	return "Codigo ya existe #{envio.codigoEnvio}"
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

class VistaEntrada
    def mostrarFormularioEnvioMaritimo
      datos = []
      print "codigoEnvio:"
      codigo = gets.chomp.to_s
      print "volumenMetrico:"
      volumenMetrico = gets.chomp.to_f
      print "categoriaEnvio:"
      categoriaEnvio = gets.chomp.to_i
      print "razonSocial:"
      razonSocial = gets.chomp.to_s
      datos.push(codigo, volumenMetrico, categoriaEnvio, razonSocial)
      return datos
    end
    def mostrarFormularioEnvioUltramarino

      return datos
    end
end
class VistaSalida
    def mostrarMensaje(mensaje)
      puts mensaje
    end
end

class Controlador
  attr_reader :vistaEntrada, :vistaSalida, :jefe
  def initialize(vistaEntrada, vistaSalida, jefe)
    @vistaEntrada=vistaEntrada
    @vistaSalida=vistaSalida
    @jefe = jefe
  end
  def registrarEnvio(tipo)
      if tipo == "m"
        datos = vistaEntrada.mostrarFormularioEnvioMaritimo
       else
        datos = vistaEntrada.mostrarFormularioEnvioUltramarino
      end
      envio = Factoria.create(tipo, datos)
      mensaje = jefe.registrar(envio)
      vistaSalida.mostrarMensaje(mensaje)
  end
end

###### TEST ######
jefe = Jefe.new
vistaEntrada = VistaEntrada.new
vistaSalida = VistaSalida.new
controlador = Controlador.new(vistaEntrada, vistaSalida, jefe)
controlador.registrarEnvio("m")
#controlador.imprimirEnviosMaritimos


