from django.shortcuts import render
from django.http import JsonResponse
import json
import datetime
from .models import * 
from .utils import cookieCart, cartData, guestOrder

def store(request):
    user = request.user
    data = cartData(request)

    cart = Cart.objects.get(user=user, complete=False, is_current_cart=True)
    product_cart_list = ProductCart.objects.filter(cart=cart)

    products = Product.objects.all()
    if user.is_authenticated == False:
        context = {"user":0,'products':products, 'cartItems':cartItems}
        return render(request, 'store/store.html', context)
    else:
        return render(request, 'store/store.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name, 
        'products':products, 'cartItems':product_cart_list.count()})

def cart(request):
    user = request.user
    data = cartData(request)
    # cartItems = data['cartItems']
    order = data['order']
    items = data['items']

    cart = Cart.objects.get(user=user, complete=False, is_current_cart=True)
    product_cart_list = ProductCart.objects.filter(cart=cart)


    if user.is_authenticated == False:
        context = {"user":0,'items':items, 'order':order, 'cartItems':cartItems}
        return render(request, 'store/cart.html', context)
    else:
        return render(request, 'store/cart.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name,
        'items':product_cart_list, 'order':order, 'cartItems':product_cart_list.count()})

def checkout(request):
    user = request.user
	
    data = cartData(request)
    cartItems = data['cartItems']
    order = data['order']
    items = data['items']

    is_complete = False
    if request.method == "POST":
        current_cart = Cart.objects.get(user=user, complete=False, is_current_cart=True)
        new_order = Order(cart=current_cart, status=1)
        current_cart.complete=True
        current_cart.is_current_cart=False
        current_cart.save()
        new_cart = Cart(user=user, complete=False, is_current_cart=True)
        new_cart.save()
        is_complete = True
        

    cart = Cart.objects.get(user=user, complete=False, is_current_cart=True)
    product_cart_list = ProductCart.objects.filter(cart=cart)

    data = cartData(request)
    cartItems = data['cartItems']
    order = data['order']
    items = data['items']

    context = {"user":1, "first_name": user.first_name, "last_name": user.last_name,
        'items':product_cart_list, 'order':order, 'cartItems':product_cart_list.count()}
    if is_complete == True:
        context["order_status"] = "done"

    if user.is_authenticated == False:
        context = {"user":0,'items':items, 'order':order, 'cartItems':cartItems}
        return render(request, 'store/checkout.html', context)
    else:
        return render(request, 'store/checkout.html', context)
	

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

def update_item(request):
	data = json.loads(request.body)
	product_id = data['productId']
	action = data['action']
	print('Action:', action)
	print('Product:', product_id)

	user = request.user
	product = Product.objects.get(id=product_id)
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