from django.shortcuts import render
from .forms import *
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.contrib.auth import authenticate, login, logout
from .models import *
from store.models import *
from store.utils import cookieCart, cartData, guestOrder
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
    
    return render(request, 'register/register.html', {'form': form})

def user_login(request):
    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            user = authenticate(request, username=form.cleaned_data.get('username'), password=form.cleaned_data.get('password'))
            if user is None:
                return render(request, 'register/login.html', {'error': "Login information is wrong", 'form': form})
            else:
                login(request, user)
                data = cartData(request)

                cartItems = data['cartItems']
                order = data['order']
                items = data['items']

                products = Product.objects.all()
                # return render(request, 'store/store.html', {"user":1, "first_name": user.first_name, "last_name": user.last_name, 'products':products, 'cartItems':cartItems})
                return HttpResponseRedirect('/')
    else:
        form = LoginForm()
        return render(request, 'register/login.html', {'form': form})



def index(request):
    user = request.user
    if user.is_authenticated == False:
        form = LoginForm()
        return HttpResponseRedirect('/login', {'form': form})
    else:
        return render(request, 'register/index.html', {"first_name": user.first_name, "last_name": user.last_name})

def user_logout(request):
    user = request.user
    if user.is_authenticated:
        logout(request)
        return HttpResponseRedirect('/login')
    return JsonResponse({
        "msg": "No user provided"
    })
