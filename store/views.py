from django.shortcuts import render

def store(request):
    user = request.user
    if user.is_authenticated == False:
        context = {"user":0}
        return render(request, 'store/store.html', context)
    else:
        return render(request, 'store/store.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name})

def cart(request):
    user = request.user
    if user.is_authenticated == False:
        context = {"user":0}
        return render(request, 'store/cart.html', context)
    else:
        return render(request, 'store/cart.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name})

def checkout(request):
    user = request.user
    if user.is_authenticated == False:
        context = {"user":0}
        return render(request, 'store/checkout.html', context)
    else:
        return render(request, 'store/checkout.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name})