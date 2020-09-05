def raise_and_rescue  
  begin  
    puts 'Estoy antes del raise'
    1/0
    puts 'Estoy después del raise' 
  rescue Exception => e
    puts 'Estoy rescatado del error.' 
    puts e.message            # Test de excepción
    puts e.backtrace.inspect   # ["nombre de fichero:linea de la excepción"]   
  end  
    puts 'Estoy después del bloque'
end  
 
raise_and_rescue