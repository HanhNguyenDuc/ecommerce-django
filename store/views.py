from django.shortcuts import render
from django.http import JsonResponse, HttpResponseRedirect
import json
import datetime
from .models import * 
from .utils import cookieCart, cartData, guestOrder

def store(request):
    user = request.user
    if user.is_authenticated == False:
        products = Product.objects.all()
        data = cartData(request)
        context = {"user":0,'products':products, 'cartItems':data.get("cartItems")}
        return render(request, 'store/store.html', context)

        return HttpResponseRedirect('/login')
    else:
        cart = Cart.objects.filter(user=user, complete=False).latest('id')
        if cart.complete == True:
            cart = Cart(user=user, complete=False)
            cart.save()
        product_cart_list = CartDetail.objects.filter(cart=cart)

        products = Product.objects.all()
        return render(request, 'store/store.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name, 
            'products':products, 'cartItems':product_cart_list.count()})

def cart(request):
    user = request.user

    if user.is_authenticated == False:
        data = cartData(request)
        order = data['order']
        items = data['items']
        context = {"user":0,'items':items, 'order':order, 'cartItems':data.get("cartItems")}
        return render(request, 'store/cart.html', context)
    else:
        cart = Cart.objects.filter(user=user, complete=False).latest('id')
        if cart.complete == True:
            cart = Cart(user=user, complete=False)
            cart.save()
        product_cart_list = CartDetail.objects.filter(cart=cart)
        cart_total = 0
        cart_items = 0
        for product_cart in product_cart_list:
            cart_total += product_cart.product.price * product_cart.quantity
            cart_items += product_cart.quantity
        order = {
            "get_cart_total": cart_total,
            "get_cart_items": cart_items,
        }
        return render(request, 'store/cart.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name,
            'items':product_cart_list, 'order': order, 'cartItems':product_cart_list.count()})

def checkout(request):
    user = request.user
    shipping_units = ShippingUnit.objects.all()

    if user.is_authenticated == False:
        data = cartData(request)
        cartItems = data['cartItems']
        order = data['order']
        items = data['items']
        if request.method == "POST":
            new_cart = Cart(complete=True)
            new_cart.save()
            for item in data.get('items'):
                product = Product.objects.get(id=item.get('id'))
                new_product_cart = CartDetail(cart=new_cart, product=product)
                new_product_cart.save()
            new_order = Order(cart=new_cart, status=1)
            new_order.save()


        context = {"user":0,'items':items, 'order':order, 'cartItems':cartItems, "order_status": "mailed", "shipping_units": shipping_units}
        return render(request, 'store/checkout.html', context)
    else:
        is_complete = False
        if request.method == "POST":
            current_cart = Cart.objects.filter(user=user, complete=False).latest('id')
            if current_cart.complete == True:
                current_cart = Cart(user=user, complete=False)
                current_cart.save()
            new_order = Order(cart=current_cart, status=1)
            current_cart.complete=True
            current_cart.save()
            new_cart = Cart(user=user, complete=False)
            new_cart.save()
            is_complete = True
        cart = Cart.objects.filter(user=user, complete=False).latest('id')
        if cart.complete == True:
                cart = Cart(user=user, complete=False)
                cart.save()
        product_cart_list = CartDetail.objects.filter(cart=cart)
        
        cart_total = 0
        cart_items = 0
        for product_cart in product_cart_list:
            cart_total += product_cart.product.price * product_cart.quantity
            cart_items += product_cart.quantity
        order = {
            "get_cart_total": cart_total,
            "get_cart_items": cart_items,
        }
        context = {"user":1, "first_name": user.first_name, "last_name": user.last_name,
        'items':product_cart_list, 'order':order, 'cartItems':product_cart_list.count(), "shipping_units": shipping_units}
        if is_complete == True:
            context["order_status"] = "done"
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

	return JsonResponse('Payment submitted...', safe=False)

def update_item(request):
	data = json.loads(request.body)
	product_id = data['productId']
	action = data['action']
	print('Action:', action)
	print('Product:', product_id)

	user = request.user
	product = Product.objects.get(id=product_id)
	cart = Cart.objects.filter(user=user, complete=False).latest('id')
	if cart.complete == True:
		cart = Cart(user=user, complete=False)
		cart.save()

	orderItem, created = CartDetail.objects.get_or_create(cart=cart, product=product)

	if action == 'add':
		orderItem.quantity = (orderItem.quantity + 1)
	elif action == 'remove':
		orderItem.quantity = (orderItem.quantity - 1)

	orderItem.save()

	if orderItem.quantity <= 0:
		orderItem.delete()

	return JsonResponse('Item was added', safe=False)