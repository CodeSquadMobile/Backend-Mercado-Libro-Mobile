# Generated by Django 4.2 on 2024-05-30 05:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0002_alter_libro_descripcion'),
    ]

    operations = [
        migrations.AddField(
            model_name='libro',
            name='autor',
            field=models.ForeignKey(default=0, on_delete=django.db.models.deletion.CASCADE, to='ecommerce.autor'),
            preserve_default=False,
        ),
    ]
