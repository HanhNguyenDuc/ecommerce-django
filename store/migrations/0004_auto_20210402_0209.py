# Generated by Django 3.1.7 on 2021-04-02 02:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0003_auto_20210402_0200'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cart',
            name='is_current_cart',
            field=models.BooleanField(null=True, verbose_name='is_current_cart'),
        ),
    ]