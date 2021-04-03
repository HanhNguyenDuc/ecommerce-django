import json
from .models import *
from register.models import *

def cookieCart(request):

	#Create empty cart for now for non-logged in user
	try:
		cart = json.loads(request.COOKIES['cart'])
	except:
		cart = {}
		print('CART:', cart)

	items = []
	order = {'get_cart_total':0, 'get_cart_items':0, 'shipping':False}
	cartItems = order['get_cart_items']

	print("[info] Cart: {}".format(cart))
	for i in cart:
		try:
			cartItems += cart[i]['quantity']

			product = Product.objects.get(id=i)
			total = (product.price * cart[i]['quantity'])

			order['get_cart_total'] += total
			order['get_cart_items'] += cart[i]['quantity']

			item = {
				'id':product.id,
				'product':{'id':product.id,'name':product.name, 'price':product.price, 
				'image':product.image}, 'quantity':cart[i]['quantity'], 'get_total':total,
				}
			items.append(item)

		except:
			pass

	print(items)
			
	return {'cartItems':cartItems ,'order':order, 'items':items}

def cartData(request):
	cookieData = cookieCart(request)
	cartItems = cookieData.get("cartItems")
	if cartItems is None:
		cartItems = []
	order = cookieData['order']
	items = cookieData.get('items')
	if items is None:
		return []

	return {'cartItems':cartItems ,'order':order, 'items':items}

	
def guestOrder(request, data):
	name = data['form']['name']
	email = data['form']['email']

	cookieData = cookieCart(request)
	items = cookieData['items']

	user, created = User.objects.get_or_create(
			email=email,
			)
	user.name = name
	user.save()

	cart = Cart.objects.create(
		user=user,
		complete=False,
		)

	for item in items:
		product = Product.objects.get(id=item['id'])
		orderItem = ProductCart.objects.create(
			product=product,
			cart=cart,
			quantity=item['quantity'],
		)
	return user, cart