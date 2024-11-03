from rest_framework import serializers
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password
from .models import (
    Categoria,
    Autor,
    Libro,
    Pedido,
    ItemCarrito,
    Direccion,
    MetodoPago,
    Reseña, 
    Contacto
)

class UserSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    email = serializers.EmailField(required=True)
    username = serializers.CharField(required=True)
    password = serializers.CharField(write_only=True, min_length=8)

    def create(self, validated_data):
        validated_data['password'] = make_password(validated_data['password'])
        return get_user_model().objects.create(**validated_data)

    class Meta:
        model = get_user_model()
        fields = ('id', 'email', 'username', 'password')


class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ('id_categoria', 'nombre_categoria') 

class AutorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Autor
        fields = ('id_autor', 'nombre_autor')  

class LibroSerializer(serializers.ModelSerializer):
    autor = AutorSerializer(read_only=True)  
    categoria = CategoriaSerializer(read_only=True)  

    class Meta:
        model = Libro
        fields = ('id_libro', 'titulo', 'precio', 'stock', 'descripcion', 'portada', 'autor', 'categoria') 

class DireccionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Direccion
        fields = ['calle', 'numero', 'ciudad', 'provincia']

    def create(self, validated_data):
        return Direccion.objects.create(usuario=self.context['request'].user, **validated_data)

class MetodoPagoSerializer(serializers.ModelSerializer):
    TARJETA_OPCIONES = [
        ('debito', 'Tarjeta Débito'),
        ('credito', 'Tarjeta Crédito'),
    ]

    tipo_tarjeta = serializers.ChoiceField(choices=TARJETA_OPCIONES)  

    class Meta:
        model = MetodoPago
        fields = ['id', 'usuario', 'numero_tarjeta', 'cvv', 'vencimiento', 'tipo_tarjeta']  
        
    def validate_numero_tarjeta(self, value):
        if len(value) != 16 or not value.isdigit():
            raise serializers.ValidationError("El número de tarjeta debe tener 16 dígitos.")
        return value

    def validate_cvv(self, value):
        if len(value) != 3 or not value.isdigit():
            raise serializers.ValidationError("El CVV debe tener 3 dígitos.")
        return value

    def validate_vencimiento(self, value):
        if len(value) != 5 or value[2] != '/':
            raise serializers.ValidationError("El formato de vencimiento debe ser MM/AA.")
        
        mes = value[:2]
        if not (1 <= int(mes) <= 12):
            raise serializers.ValidationError("El mes debe estar entre 01 y 12.")
        return value

    def create(self, validated_data):
        usuario = self.context['request'].user 
        validated_data.pop('usuario', None)
        return MetodoPago.objects.create(usuario=usuario, **validated_data)

    def update(self, instance, validated_data):
        instance.numero_tarjeta = validated_data.get('numero_tarjeta', instance.numero_tarjeta)
        instance.cvv = validated_data.get('cvv', instance.cvv)
        instance.vencimiento = validated_data.get('vencimiento', instance.vencimiento)
        instance.tipo_tarjeta = validated_data.get('tipo_tarjeta', instance.tipo_tarjeta)
        instance.save()
        return instance

class ItemCarritoSerializer(serializers.ModelSerializer):
    email_usuario = serializers.EmailField(source='usuario.email', read_only=True)
    titulo_libro = serializers.CharField(source='libro.titulo', read_only=True)
    precio_unitario = serializers.DecimalField(source='libro.precio', max_digits=10, decimal_places=2, read_only=True)
    total = serializers.SerializerMethodField()

    class Meta:
        model = ItemCarrito
        fields = ['id', 'libro', 'usuario', 'email_usuario', 'titulo_libro', 'cantidad', 'precio_unitario', 'total']  # Incluye el campo 'id' aquí

    def validate_cantidad(self, value):
        if value < 1:
            raise serializers.ValidationError("La cantidad debe ser al menos 1.")
        return value

    def create(self, validated_data):
        libro = validated_data.get('libro')
        usuario = validated_data.get('usuario')
        cantidad_solicitada = validated_data['cantidad']

        if libro.stock < cantidad_solicitada:
            raise serializers.ValidationError("La cantidad solicitada supera el stock disponible.")

        item, created = ItemCarrito.objects.get_or_create(
            usuario=usuario,
            libro=libro,
            defaults={'cantidad': cantidad_solicitada}
        )

        if not created:
            item.cantidad += cantidad_solicitada
            item.save()

        return item

    def get_total(self, obj):
        return obj.total

class PedidoSerializer(serializers.ModelSerializer):
    direccion = DireccionSerializer()

    class Meta:
        model = Pedido
        fields = ['id_pedido', 'usuario', 'direccion', 'metodo_pago', 'estado', 'fecha_pedido', 'total']

    def create(self, validated_data):
        direccion_data = validated_data.pop('direccion')
        direccion = DireccionSerializer.create(DireccionSerializer(), validated_data=direccion_data)
        pedido = Pedido.objects.create(direccion=direccion, **validated_data)
        return pedido

class ReseñaSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    titulo_libro = serializers.CharField(source='libro.titulo', read_only=True)
    email_usuario = serializers.EmailField(source='usuario.email', read_only=True)
    
    class Meta:
        model = Reseña
        fields = ['id', 'libro','titulo_libro', 'email_usuario', 'comentario', 'fecha_creacion']

class ContactoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contacto
        fields = ['nombre', 'email', 'asunto', 'mensaje']
