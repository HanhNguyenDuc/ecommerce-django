from django.db import models
from django.contrib.auth.models import User
from .enums import *


def custom_media_path(instance, filename):
    file_ext = filename.split(".")[-1]
    return str(uuid.uuid4()) + "." + file_ext


class Image(models.Model):
    img_url = models.FileField(
        upload_to=custom_media_path, max_length=100, default="default.jpg"
    )

# Create your models here.
class Payment(models.Model):
    bank_name = models.CharField("bank_name", max_length=100)
    account_number = models.CharField("account_number", max_length=100)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

class Comment(models.Model):
    content = models.CharField("content", max_length=255)
    rate = models.IntegerField("rate", default=1)
    created_time = models.TimeField("created_time", auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)


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

class ProductCart(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField("quantity")
    price = models.FloatField("price")

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
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE)