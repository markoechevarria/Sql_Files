from collections import Counter
from collections import namedtuple
from collections import OrderedDict
from collections import defaultdict
from collections import deque

string = "aaaabbbcc"
my_counter = Counter(string)
print(my_counter)
print(my_counter.values())
print(my_counter.keys())
print(my_counter.most_common(1))
print(list(my_counter.elements()))



Point = namedtuple('Point', 'x,y')
pt = Point(1, -1)
print(pt)
print(pt.x, pt.y)



ordered_dict = OrderedDict()
ordered_dict['a'] = 1
ordered_dict['b'] = 2
ordered_dict['c'] = 3
ordered_dict['d'] = 4
print(ordered_dict)



d = defaultdict(int)
d['a'] = 1
d['b'] = 2
print(d['b'])



d = deque()
d.append(1)
d.appendleft(2)
d.pop()
d.popleft()
d.clear()
d.extend([10,11,12])
d.extendleft([100,101,102])
d.rotate(1)
d.rotate(-2)
