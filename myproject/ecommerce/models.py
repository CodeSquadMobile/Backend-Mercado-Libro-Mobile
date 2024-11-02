from django.db import models
from django.contrib.auth.models import AbstractUser
from django.conf import settings

class CustomUser(AbstractUser):
    email=models.EmailField(max_length=150, unique=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    def __str__(self):
        return self.email


class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nombre_categoria = models.CharField(max_length=100)

    class Meta:
        db_table = 'categoria'

    def __str__(self):
        return self.nombre_categoria

class Autor(models.Model):
    id_autor = models.AutoField(primary_key=True)
    nombre_autor = models.CharField(max_length=200)

    class Meta:
        db_table = 'autor'

    def __str__(self):
        return self.nombre_autor

def get_upload_path(instance, filename):
    return f'libros/{instance.titulo}/{filename}'

from cloudinary.models import CloudinaryField

class Libro(models.Model):
    id_libro = models.AutoField(primary_key=True)
    titulo = models.CharField(blank=False, max_length=255)
    precio = models.DecimalField(blank=False, max_digits=10, decimal_places=2)
    stock = models.IntegerField(blank=False)
    categoria = models.ForeignKey(Categoria, to_field='id_categoria', on_delete=models.CASCADE)
    descripcion = models.TextField(blank=False)
    portada = CloudinaryField('image', null=True, blank=True)
    autor = models.ForeignKey(Autor, to_field='id_autor', on_delete=models.CASCADE)

    class Meta:
        db_table = 'libro'


class Direccion(models.Model):
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    calle = models.CharField(max_length=100)
    numero = models.CharField(max_length=10) 
    ciudad = models.CharField(max_length=50)
    provincia = models.CharField(max_length=50)

    class Meta:
        db_table = 'direccion'

    def __str__(self):
        return f'{self.calle} {self.numero}, {self.ciudad}, {self.provincia}'

class ItemCarrito(models.Model):
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    cantidad = models.IntegerField(default=1)
    fecha_agregado = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'item_carrito'
        unique_together = ('usuario', 'libro') 

    def __str__(self):
        libro_titulo = self.libro.titulo if self.libro else "Libro no disponible"
        return f'{self.cantidad} de {libro_titulo}'

    @property
    def total(self):
        return self.cantidad * self.libro.precio

class MetodoPago(models.Model):
    TARJETA_OPCIONES = [
        ('debito', 'Tarjeta Débito'),
        ('credito', 'Tarjeta Crédito'),
    ]
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    numero_tarjeta = models.CharField(max_length=16)  
    cvv = models.CharField(max_length=3)  
    vencimiento = models.CharField(max_length=5)
    tipo_tarjeta = models.CharField(max_length=7, choices=TARJETA_OPCIONES)

    class Meta:
        db_table = 'metodo_pago'

    def __str__(self):
        return f'Método de pago de {self.usuario} ({self.get_tipo_tarjeta_display()})'  

class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    direccion = models.ForeignKey(Direccion, on_delete=models.CASCADE)
    metodo_pago = models.CharField(max_length=7, choices=MetodoPago.TARJETA_OPCIONES)  
    estado = models.CharField(max_length=50, default='En camino')
    fecha_pedido = models.DateTimeField(auto_now_add=True)
    total = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        db_table = 'pedido'

    def __str__(self):
        return f'Pedido {self.id_pedido} de {self.usuario}, pagado con {self.get_metodo_pago_display()}'

class Reseña(models.Model):
    libro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    comentario = models.TextField()
    fecha_creacion = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'reseña'
    
    def __str__(self):
        return f'Reseña de {self.usuario.email} para {self.libro.titulo}'

class Contacto(models.Model):
    nombre = models.CharField(max_length=100)
    email = models.EmailField()
    asunto = models.CharField(max_length=150)
    mensaje = models.TextField()

    def __str__(self):
        return f"{self.nombre} - {self.asunto}"
