from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from .models import Categoria, Libro, Autor, ItemCarrito, Pedido, Direccion, MetodoPago, Reseña

@admin.register(get_user_model())
class CustomUserAdmin(UserAdmin):
    list_display = ('username', 'email', 'password')

class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('nombre_categoria',)

class AutorAdmin(admin.ModelAdmin):
    list_display = ('nombre_autor',)

class LibroAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'portada', 'id_categoria', 'id_autor', 'descripcion', 'precio', 'stock')

class PedidoAdmin(admin.ModelAdmin):
    list_display = ('id_pedido', 'usuario', 'direccion', 'metodo_pago', 'fecha_pedido', 'total', 'estado')
    search_fields = ('usuario__email',)
    list_filter = ('estado', 'fecha_pedido')

class ItemCarritoAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'libro', 'cantidad')
    search_fields = ('usuario__email', 'libro__titulo')
    list_filter = ('fecha_agregado',)

class DireccionAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'calle', 'numero', 'ciudad', 'provincia')
    search_fields = ('usuario__email', 'calle', 'numero', 'ciudad', 'provincia')

class MetodoPagoAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'numero_tarjeta', 'vencimiento', 'tipo_tarjeta') 
    search_fields = ('usuario__email', 'numero_tarjeta')

class ReseñaAdmin(admin.ModelAdmin):
    list_display = ('libro', 'usuario', 'comentario', 'fecha_creacion')
    search_fields = ('usuario__email', 'libro__titulo')  
    list_filter = ('libro', 'usuario')

admin.site.register(Categoria)
admin.site.register(Autor)
admin.site.register(Libro)
admin.site.register(Pedido, PedidoAdmin)
admin.site.register(ItemCarrito, ItemCarritoAdmin)
admin.site.register(Direccion, DireccionAdmin)
admin.site.register(MetodoPago, MetodoPagoAdmin)
admin.site.register(Reseña, ReseñaAdmin)