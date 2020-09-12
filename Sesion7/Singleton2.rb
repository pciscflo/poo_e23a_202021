require 'singleton'
 
class AppConfig
  include Singleton
  def mostrar
  	 "Hello"
  end
end

ap = AppConfig.instance
puts ap.mostrar
ap1 = AppConfig.instance
puts ap1.mostrar

if ap == ap1
   puts "Iguales"
else
	puts "Diferentes"
end
