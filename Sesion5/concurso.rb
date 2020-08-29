class Concursante
   attr_reader :dni, :nombre, :apellido, :edad, :cantidadMensajesTexto
   def initialize(dni, nombre, apellido, edad, cantidadMensajesTexto)
      @dni = dni
      @nombre = nombre
      @apellido = apellido
      @edad = edad
      @cantidadMensajesTexto = cantidadMensajesTexto
   end
   def calcularPuntaje
   end
end

class FanMasacre < Concursante
   attr_reader :equipo, :puntajeBarra, :puntajeEquipo
   def initialize(dni, nombre, apellido, edad, cantidadMensajesTexto, equipo, puntajeBarra, puntajeEquipo)
      super(dni, nombre, apellido, edad, cantidadMensajesTexto) #llama a initialize de la superclase
      @equipo = equipo
      @puntajeBarra = puntajeBarra
      @puntajeEquipo = puntajeEquipo
   end
   def calcularPuntaje
    return cantidadMensajesTexto*4 + puntajeBarra + puntajeEquipo*2
   end

end

class Televidente < Concursante
  attr_reader :numeroTel, :cantidadLlamadas
  def initialize(dni, nombre, apellido, edad, cantidadMensajesTexto, numeroTel, cantidadLlamadas)
     super(dni, nombre, apellido, edad, cantidadMensajesTexto)
     @numeroTel = numeroTel
     @cantidadLlamadas = cantidadLlamadas
  end
  def calcularPuntaje
     return cantidadMensajesTexto*4 + cantidadLlamadas*3
  end
end

class Administrador
   attr_reader :concursantes, :nombre
   def initialize(nombre)
      @nombre = nombre
      @concursantes =[]
   end
   def registrar(concursante)
     if concursante.edad >=18
       concursantes.push(concursante)
     else
      puts "No está permitido ingreso de menores"
     end
   end
   def obtenerGanador
       maximo = 0
       c = nil
       for concursante in concursantes
         if concursante.calcularPuntaje>maximo
            maximo = concursante.calcularPuntaje
            c = concursante
         end
       end
       return c
   end
end

fan1 = FanMasacre.new("88888888", "Carlos", "Perez", 30, 200, "nuclear", 200, 100)
tele1 = Televidente.new("99999999", "Luis", "Suarez", 15, 190, 3849505, 240)
tele2 = Televidente.new("77777777", "Jose", "Torres", 29, 200, 3849205, 120)

adm = Administrador.new("Roberto")
adm.registrar(fan1)
adm.registrar(tele1)
adm.registrar(tele2)
ganador = adm.obtenerGanador
puts "Ganador: #{ganador.nombre} Puntaje: #{ganador.calcularPuntaje}"




