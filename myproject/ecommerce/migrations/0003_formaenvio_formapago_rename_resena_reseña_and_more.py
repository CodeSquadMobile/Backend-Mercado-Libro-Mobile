# Generated by Django 4.2 on 2024-05-21 14:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0002_autor_detallepedido_direccion_historialpedido_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='FormaEnvio',
            fields=[
                ('id_forma_envio', models.AutoField(primary_key=True, serialize=False)),
                ('descripcion', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'forma_envio',
            },
        ),
        migrations.CreateModel(
            name='FormaPago',
            fields=[
                ('id_forma_pago', models.AutoField(primary_key=True, serialize=False)),
                ('descripcion', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'forma_pago',
            },
        ),
        migrations.RenameModel(
            old_name='Resena',
            new_name='Reseña',
        ),
        migrations.AlterUniqueTogether(
            name='usuarioclienteadministrador',
            unique_together=None,
        ),
        migrations.RemoveField(
            model_name='usuarioclienteadministrador',
            name='administrador',
        ),
        migrations.RemoveField(
            model_name='usuarioclienteadministrador',
            name='usuario_cliente',
        ),
        migrations.AlterModelOptions(
            name='autor',
            options={},
        ),
        migrations.AlterModelOptions(
            name='detallepedido',
            options={},
        ),
        migrations.AlterModelOptions(
            name='libro',
            options={},
        ),
        migrations.AlterModelOptions(
            name='libroautor',
            options={},
        ),
        migrations.AlterModelOptions(
            name='pedido',
            options={},
        ),
        migrations.RenameField(
            model_name='categoria',
            old_name='categoria',
            new_name='nombre_categoria',
        ),
        migrations.RenameField(
            model_name='direccion',
            old_name='usuario',
            new_name='usuario_cliente',
        ),
        migrations.RenameField(
            model_name='reseña',
            old_name='usuario',
            new_name='usuario_cliente',
        ),
        migrations.RenameField(
            model_name='usuariocliente',
            old_name='correo_electronico',
            new_name='email',
        ),
        migrations.RemoveField(
            model_name='autor',
            name='apellido',
        ),
        migrations.RemoveField(
            model_name='direccion',
            name='estado',
        ),
        migrations.RemoveField(
            model_name='libro',
            name='autor',
        ),
        migrations.RemoveField(
            model_name='pedido',
            name='cliente',
        ),
        migrations.AddField(
            model_name='direccion',
            name='provincia',
            field=models.CharField(default='Desconocido', max_length=100, verbose_name='Provincia'),
        ),
        migrations.AddField(
            model_name='libro',
            name='descripcion',
            field=models.CharField(default='No disponible', max_length=100, verbose_name='Descripcion'),
        ),
        migrations.AddField(
            model_name='libro',
            name='portada',
            field=models.ImageField(default='No disponible', upload_to='portadas/', verbose_name='Portada'),
        ),
        migrations.AddField(
            model_name='pedido',
            name='direccion_envio',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ecommerce.direccion'),
        ),
        migrations.AddField(
            model_name='pedido',
            name='usuario_cliente',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ecommerce.usuariocliente'),
        ),
        migrations.AlterField(
            model_name='autor',
            name='nombre',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='direccion',
            name='ciudad',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='direccion',
            name='direccion',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='direccion',
            name='pais',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='historialpedido',
            name='estado_pedido',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='libroautor',
            name='id',
            field=models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
        migrations.AlterField(
            model_name='pedido',
            name='estado_pedido',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='pedido',
            name='fecha_pedido',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='usuarioadministrador',
            name='usuario',
            field=models.CharField(max_length=100, unique=True),
        ),
        migrations.AlterField(
            model_name='usuariocliente',
            name='nombre',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterUniqueTogether(
            name='libroautor',
            unique_together={('libro', 'autor')},
        ),
        migrations.AlterModelTable(
            name='direccion',
            table='direccion',
        ),
        migrations.AlterModelTable(
            name='historialpedido',
            table='historial_pedido',
        ),
        migrations.AlterModelTable(
            name='reseña',
            table='resena',
        ),
        migrations.AlterModelTable(
            name='usuarioadministrador',
            table='usuario_administrador',
        ),
        migrations.AlterModelTable(
            name='usuariocliente',
            table='usuario_cliente',
        ),
        migrations.DeleteModel(
            name='LibroAdministrador',
        ),
        migrations.DeleteModel(
            name='UsuarioClienteAdministrador',
        ),
        migrations.AddField(
            model_name='pedido',
            name='forma_envio',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ecommerce.formaenvio'),
        ),
        migrations.AddField(
            model_name='pedido',
            name='forma_pago',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ecommerce.formapago'),
        ),
    ]
