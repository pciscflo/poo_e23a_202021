class Auto
  def initialize(codigo, marca, precio)
  	@codigo = codigo
  	@marca = marca
  	@precio = precio
  end
  def calc_descuento
  	@precio*0.10
  end
  def calc_igv
  	@precio*0.18
  end
end

o1 = Auto.new(23556, "Volvo", 20000)
o3 = Auto.new(35666, "Toyota", 25000)
o9 = Auto.new(55555, "KIA", 22000)

#creando un arreglo vacio
autos = []
#autos = [o1, o3, o9] 
autos.push(o1) ## push es adicionar un elemento al arreglo autos
autos.push(o3)
autos.push(o9)

for a in autos
   puts a.calc_descuento   #puts es pintar o imprimir en pantalla
end