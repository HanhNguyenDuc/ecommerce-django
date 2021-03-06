# Generated by Django 3.1.2 on 2021-03-17 08:54

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import register.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.TimeField(auto_now_add=True)),
                ('is_current_cart', models.BooleanField(verbose_name='is_current_cart')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.CharField(max_length=255, verbose_name='content')),
                ('rate', models.IntegerField(default=1, verbose_name='rate')),
                ('created_time', models.TimeField(auto_now_add=True, verbose_name='created_time')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img_url', models.FileField(default='default.jpg', upload_to=register.models.custom_media_path)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='name')),
                ('price', models.FloatField(verbose_name='price')),
                ('source', models.CharField(max_length=255, verbose_name='source')),
                ('information', models.CharField(max_length=255, verbose_name='information')),
                ('amount', models.IntegerField(verbose_name='amount')),
                ('image', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='register.image')),
            ],
        ),
        migrations.CreateModel(
            name='ShippingUnit',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='name')),
                ('price', models.FloatField(verbose_name='price')),
            ],
        ),
        migrations.CreateModel(
            name='ProductCart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField(verbose_name='quantity')),
                ('price', models.FloatField(verbose_name='price')),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='register.cart')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='register.product')),
            ],
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bank_name', models.CharField(max_length=100, verbose_name='bank_name')),
                ('account_number', models.CharField(max_length=100, verbose_name='account_number')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.SmallIntegerField(choices=[(0, 'GETTING'), (1, 'DELIVERY'), (2, 'DELIVERIED'), (3, 'TAKEN')], default=0, verbose_name='status')),
                ('order_time', models.TimeField(auto_now_add=True, verbose_name='order_time')),
                ('confirm_time', models.TimeField(null=True, verbose_name='confirm_time')),
                ('payment_time', models.TimeField(null=True, verbose_name='payment_time')),
                ('delivery_time', models.TimeField(null=True, verbose_name='delivery_time')),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='register.cart')),
                ('comment', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='register.comment')),
                ('shipping_unit', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='register.shippingunit')),
            ],
        ),
    ]
