from django.shortcuts import render
from django.http import JsonResponse
import json
import datetime
from .models import * 
from .utils import cookieCart, cartData, guestOrder

def store(request):
    user = request.user
    data = cartData(request)

    cartItems = data['cartItems']
    order = data['order']
    items = data['items']

    products = Product.objects.all()
    if user.is_authenticated == False:
        context = {"user":0,'products':products, 'cartItems':cartItems}
        return render(request, 'store/store.html', context)
    else:
        return render(request, 'store/store.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name, 
        'products':products, 'cartItems':cartItems})

def cart(request):
    user = request.user
    data = cartData(request)
    cartItems = data['cartItems']
    order = data['order']
    items = data['items']

    if user.is_authenticated == False:
        context = {"user":0,'items':items, 'order':order, 'cartItems':cartItems}
        return render(request, 'store/cart.html', context)
    else:
        return render(request, 'store/cart.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name,
        'items':items, 'order':order, 'cartItems':cartItems})

def checkout(request):
    user = request.user
    data = cartData(request)
	
    cartItems = data['cartItems']
    order = data['order']
    items = data['items']
    if user.is_authenticated == False:
        context = {"user":0,'items':items, 'order':order, 'cartItems':cartItems}
        return render(request, 'store/checkout.html', context)
    else:
        return render(request, 'store/checkout.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name,
        'items':items, 'order':order, 'cartItems':cartItems})

def updateItem(request):
	data = json.loads(request.body)
	productId = data['productId']
	action = data['action']
	print('Action:', action)
	print('Product:', productId)

	user = request.user
	product = Product.objects.get(id=productId)
	cart, created = Cart.objects.get_or_create(user=user, complete=False)

	orderItem, created = ProductCart.objects.get_or_create(cart=cart, product=product)

	if action == 'add':
		orderItem.quantity = (orderItem.quantity + 1)
	elif action == 'remove':
		orderItem.quantity = (orderItem.quantity - 1)

	orderItem.save()

	if orderItem.quantity <= 0:
		orderItem.delete()

	return JsonResponse('Item was added', safe=False)

def processOrder(request):
	transaction_id = datetime.datetime.now().timestamp()
	data = json.loads(request.body)

	if request.user.is_authenticated:
		user = request.user
		cart, created = Cart.objects.get_or_create(user=user, complete=False)
	else:
		user, cart = guestOrder(request, data)

	total = float(data['form']['total'])
	cart.transaction_id = transaction_id

	if total == cart.get_cart_total:
		cart.complete = True
	cart.save()

	if cart.complete == True:
		Order.objects.create(
		cart=cart,
	)

	return JsonResponse('Payment submitted..', safe=False)