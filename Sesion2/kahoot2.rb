class Monedero
  def initialize(codigo, saldo)
  	@codigo = codigo
    @saldo = saldo
  end
  def abonar (monto)
     @saldo =  @saldo + monto
  end

  def retirar(monto)
     @saldo = @saldo - monto
  end
  def obtenerSaldo
  	@saldo
  end
  def aplicarInteres
  	@saldo*PORCENTAJE
  end
end
PORCENTAJE = 0.10
mon = Monedero.new("98585", 220)
mon.abonar(20)
mon.retirar(30)
mon.aplicarInteres
puts mon.obtenerSaldo




