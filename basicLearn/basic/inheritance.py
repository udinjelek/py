class Animal():
    varA = "---"
    def __init__(self,name,age):
        self.name = name
        self.age = age
        print(self.name + " has been created")
    def talk(self):
        print(self.name + "Say : ...")
    def myinfo(self):
        print(self.varA + " Info name: " +  self.name + " | Info age: " + str(self.age) + " " + self.varA)


class Cat(Animal):
    def talk(self):
        print(self.name + " Say: Meow")
 
 
class Bird(Animal):
    def __init__(self,name,age):
         super().__init__(name,age)     
    def talk(self):
        print(self.name + " Say: BrrrBrr")


print("------------------------------")
randomAnimal = Animal("randomAnimal",9)    
randomAnimal.talk()
randomAnimal.myinfo()
print("------------------------------")
blackCat = Cat("BlackCat",2)
blackCat.talk()
blackCat.myinfo()
print("------------------------------")
blueBird = Bird("blueBird",3)
blueBird.talk()
blueBird.myinfo()
print("------------------------------")
