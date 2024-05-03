class GoFood(object):
	def __init__(self):
		self.orders = []

	def add_order(self, product, qty, price):
		self.orders.append({'product':product, 'qty':qty, 'price':price})

	def get_transport_fee(self, location):
		if location == 'pelita':
			return 5000
		return 10000

	def get_total_order(self, location, discount_voucher):
		total_order = sum([x['qty'] * x['price'] for x in self.orders])
		transport_fee = self.get_transport_fee(location)

		return total_order + transport_fee - discount_voucher

class GoFoodChild(GoFood):
    def __init__(self):
        super().__init__()

    def get_total_order(self, location, discount_voucher):
        total_order = super().get_total_order(location, discount_voucher)
        transport_fee = self.get_transport_fee(location)

        if transport_fee < 10000:
            transport_fee += 3000

        return total_order + transport_fee - discount_voucher

test = GoFoodChild()
test.add_order('mie ayam', 2, 15000)
test.add_order('teh o beng', 2, 5000)
print(test.get_total_order('pelita', 10000))