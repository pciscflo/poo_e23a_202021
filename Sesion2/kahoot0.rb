class Producto
  def initialize(codigo, descripcion, precio)
  	@codigo = codigo
    @descripcion = descripcion
    @precio = precio
  end
  def calcularDescuento
  	return 0.2*@precio
  end
  def calcularNeto
  	@precio = @precio - calcularDescuento + 1
    return @precio
  end
end
pro = Producto.new("30004","Coca Cola", 4.0)
puts pro.calcularNeto





