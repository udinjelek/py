def pizza(sizePizza,*topping):
	print('you order pizza ' + str(sizePizza) + ' diameter with topping: ' + ', '.join(topping) )

pizza(16,'monster','fire','water')