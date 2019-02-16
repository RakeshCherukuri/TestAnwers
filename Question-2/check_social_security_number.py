import re
input_string = input("Enter the number: ")
print(input_string)
is_ssn = len(re.findall(r'\d{3}-\d{2}-\d{4}',input_string)) > 0
print("is it ssn:", is_ssn)