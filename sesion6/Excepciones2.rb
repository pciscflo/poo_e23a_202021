def lanzar_excepcion
  puts 'Estoy antes del raise'
  raise 'Se ha producido un error' # lanza una excepción con el mensaje entre ''
  puts 'Estoy despues del raise'
end
 
lanzar_excepcion