# Generated by Django 4.2 on 2024-11-01 16:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0004_metodopago_tipo_tarjeta_alter_pedido_metodo_pago'),
    ]

    operations = [
        migrations.AlterField(
            model_name='metodopago',
            name='vencimiento',
            field=models.CharField(max_length=5),
        ),
    ]