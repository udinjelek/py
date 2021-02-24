import matplotlib.pyplot as plt
import pandas as pd
def create_graph():
	#plt.figure(figsize=(12,9))
	x_n = [1, 2, 3]
	y_n = [2, 4, 6]
	z_n = [2, 0, 1]
	v_n = [7, 3, 1]
	plt.plot(x_n, y_n)
	plt.plot(y_n, z_n)
	plt.plot(z_n, v_n)
	plt.plot(v_n, x_n)
	ax = plt.subplot(111)
	ax.spines["top"].set_visible(False)
	ax.spines["right"].set_visible(False)
	
	ax.get_xaxis().tick_bottom()
	ax.get_yaxis().tick_left()

	plt.xticks(fontsize = 14)
	plt.yticks(range(1,10,1),fontsize = 14)
	for y in range(0,10,1):
		plt.plot(range(0,10),[y]* len(range(0,10)),"--",lw=0.5,color="black",alpha=0.3)

	plt.text(1,10,"the data is made of jokes\nplease don't take it seriously \nbecause it's become not fun anymore ",fontsize = 8, ha ="center")
	plt.text(1,-1.5,"what should i do now? who care! still ROCK ",fontsize = 8, ha ="center")
	plt.show()

	
if __name__ == '__main__':

	# create_graph(x_n,y_n)
	# create_graph(y_n,x_n)
	create_graph()