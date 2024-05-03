class Person(object):
    def __init__(self, name):
        self.name = name

    def get_full_name(self):
        # Capitalize each part of the name
        parts = self.name.split()
        capitalized_parts = [part.capitalize() for part in parts]
        return ' '.join(capitalized_parts)

test1 = Person("james bond")
test2 = Person("robert downey junior")
test3 = Person("zendaya maree stoermer coleman")

print(test1.get_full_name())  # James Bond
print(test2.get_full_name())  # Robert Downey Junior
print(test3.get_full_name())  # Zendaya Maree Stoermer Coleman
