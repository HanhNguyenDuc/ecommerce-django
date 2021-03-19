from django.db import models
from register.models import *

class ShippingUnit(models.Model):
    name = models.CharField("name", max_length=255)
    price = models.FloatField("price")


class Product(models.Model):
    name = models.CharField("name", max_length=255)
    price = models.FloatField("price")
    source = models.CharField("source", max_length=255)
    information = models.CharField("information", max_length=255)
    amount = models.IntegerField("amount")
    image = models.ForeignKey(Image, on_delete=models.CASCADE, null=True)


class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_time = models.TimeField(auto_now_add=True)
    is_current_cart = models.BooleanField("is_current_cart")
    complete = models.BooleanField(default=False)
    transaction_id = models.CharField(max_length=100, null=True)

    def getId(self):
        return self.id 

    def __str__(self):
	    return str(self.id)

    @property
    def get_cart_total(self):
        order_items = ProductCart.objects.filter(cart=self)
        total = sum([item.get_total for item in order_items])
        return total 

    @property
    def get_cart_items(self):
        order_items = ProductCart.objects.filter(cart=self)
        total = sum([item.quantity for item in order_items])
        return total 

class ProductCart(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField("quantity", default=1)
    price = models.FloatField("price", default=10000)

    @property
    def get_total(self):
        total = self.product.price * self.quantity
        return total

    def get_product(self):
        return self.product
    

class Order(models.Model):
    status = models.SmallIntegerField(
        "status",
        null=False,
        blank=False,
        default=OrderStatus.GETTING.value,
        choices=[
            (OrderStatus.GETTING.value, OrderStatus.GETTING.name),
            (OrderStatus.DELIVERY.value, OrderStatus.DELIVERY.name),
            (OrderStatus.DELIVERIED.value, OrderStatus.DELIVERIED.name),
            (OrderStatus.TAKEN.value, OrderStatus.TAKEN.name)
        ],
    )
    order_time = models.TimeField("order_time", auto_now_add=True)
    confirm_time = models.TimeField("confirm_time", null=True)
    payment_time = models.TimeField("payment_time", null=True)
    delivery_time = models.TimeField("delivery_time", null=True)
    shipping_unit = models.ForeignKey(ShippingUnit, null=True, on_delete=models.CASCADE)
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE, null=True)

class Payment(models.Model):
    bank_name = models.CharField("bank_name", max_length=100)
    account_number = models.CharField("account_number", max_length=100)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
