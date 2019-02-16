string = list(raw_input("Enter the string:")) # Because strings are immutable in python i have converted to list
i = 0
j = len(string)-1
while i < j:
	dummy = string[i]
	string[i] = string[j]
	string[j] = dummy
	i+=1
	j-=1
print "the converted string is: "+"".join(string)
