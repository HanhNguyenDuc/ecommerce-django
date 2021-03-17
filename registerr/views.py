from django.shortcuts import render
from .forms import *
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.contrib.auth import authenticate, login
from .models import *


# Create your views here.
def register(request):
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            new_user = User(**form.cleaned_data)
            new_user.set_password(form.cleaned_data.get('password'))
            new_user.save()
            return HttpResponseRedirect('/login')
        
    else:
        form = RegisterForm
    
    return render(request, 'registerr/register.html', {'form': form})

def user_login(request):
    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            user = authenticate(request, username=form.cleaned_data.get('username'), password=form.cleaned_data.get('password'))
            if user is None:
                return render(request, 'registerr/login.html', {'error': "Login information is wrong", 'form': form})
            else:
                login(request, user)
                cart_num = Cart.objects.filter(user=request.user, is_current_cart=True).count()
                if cart_num < 1:
                    cart_new = Cart(
                        user=user,
                        is_current_cart=True,
                    )
                    cart_new.save()
                return HttpResponseRedirect('/')
    else:
        form = LoginForm()
        return render(request, 'registerr/login.html', {'form': form})


# def list_product(request):
#     user = request.user
#     context = {}
#     if request.method == "GET":
#         products = Product.objects.all()
#         context["products"] = products
#         if user.is_authenticated != False:
#             context["user"] = {
#                 "display_name": user.first_name + user.last_name
#             }
#             context["cart"] = Cart.objects.get(user=user, is_current_cart=is_current_cart)
#             context["cart_product"] = ProductCart.objects.filter(cart=context.get("cart"))

# def add_to_cart(request):
#     user = request.user
#     if user.is_authenticated == False:
#         return JsonResponse({
#             "error": "no authentication credential provided"
#         })
#     if request.method == "POST":
#         data = request.POST
#         cart = Cart.objects.get(user=user, is_current_cart=True)
#         if data.get("product_id") == None:
#             return JsonResponse({
#                 "error": "Bad request"
#             })
#         if data.get("quantity") == None:
#             data["quantity"] = 1
        
#         product = Product.objects.get(id=data.get("product_id"))
#         new_product_cart = ProductCart(
#             cart=cart,
#             product=product,
#             quantity=quantity,
#             price=product.price * data.get("quantity")
#         )
#         new_product_cart.save()
#         return HttpResponseRedirect("/products")
#     return JsonResponse({
#         "error": "method is now allowed"
#     })


# def get_cart(request):
#     user = request.user
#     if user.is_authenticated == False:
#         return JsonResponse({
#             "error": "no authentication credential provided",
#         })
#     if request.method == "GET":
#         context = {}
#         context["cart"] = 
        


def index(request):
    user = request.user
    if user.is_authenticated == False:
        form = LoginForm()
        return HttpResponseRedirect('/login', {'form': form})
    else:
        return render(request, 'registerr/index.html', {"first_name": user.first_name, "last_name": user.last_name})


