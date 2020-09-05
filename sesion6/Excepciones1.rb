def factoria(n)
	raise RuntimeError, "Argumento incorrrecto" if n<1
	return 1 if n==1
	n*factoria(n-1)
end
puts factoria(-9)
