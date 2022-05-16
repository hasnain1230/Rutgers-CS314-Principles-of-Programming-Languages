import sys

x = [1, 2, 3, 4]
sum1 = [y for y in x if y % 2 == 0]
sum1 = sum(sum1)
print(sum1)
