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
    Reseña
)

def validate_password(self, value):
    return make_password

class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True)
    username = serializers.CharField(required=True)
    password = serializers.CharField(min_length=8)

    def create(self, validated_data):
        user = get_user_model().objects.create(
            email=validated_data['email'],
            username=validated_data['username'],
            password=make_password(validated_data['password'])
        )
        return user

    class Meta:
        model = get_user_model()
        fields = ('email', 'username', 'password')

class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ('nombre_categoria',)

class AutorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Autor
        fields = ('nombre_autor',)

class LibroSerializer(serializers.ModelSerializer):
    autor = serializers.SerializerMethodField()
    categoria = serializers.SerializerMethodField()

    class Meta:
        model = Libro
        fields = '__all__'

    def get_autor(self, obj):
        return obj.id_autor.nombre_autor 

    def get_categoria(self, obj):
        return obj.id_categoria.nombre_categoria

class DireccionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Direccion
        fields = ['calle', 'numero', 'ciudad', 'provincia']

    def create(self, validated_data):
        return Direccion.objects.create(usuario=self.context['request'].user, **validated_data)

class MetodoPagoSerializer(serializers.ModelSerializer):
    class Meta:
        model = MetodoPago
        fields = ['id', 'usuario', 'numero_tarjeta', 'cvv', 'vencimiento']

    def validate_numero_tarjeta(self, value):
        if len(value) != 16 or not value.isdigit():
            raise serializers.ValidationError("El número de tarjeta debe tener 16 dígitos.")
        return value

    def validate_cvv(self, value):
        if len(value) != 3 or not value.isdigit():
            raise serializers.ValidationError("El CVV debe tener 3 dígitos.")
        return value

    def validate_vencimiento(self, value):
        if len(value) != 7 or value[2] != '/':
            raise serializers.ValidationError("El formato de vencimiento debe ser MM/AA.")
        
        mes = value[:2]
        if not (1 <= int(mes) <= 12):
            raise serializers.ValidationError("El mes debe estar entre 01 y 12.")

        return value

    def create(self, validated_data):
        return MetodoPago.objects.create(usuario=self.context['request'].user, **validated_data)

    def update(self, instance, validated_data):
        instance.numero_tarjeta = validated_data.get('numero_tarjeta', instance.numero_tarjeta)
        instance.cvv = validated_data.get('cvv', instance.cvv)
        instance.vencimiento = validated_data.get('vencimiento', instance.vencimiento)
        instance.save()
        return instance

class ItemCarritoSerializer(serializers.ModelSerializer):
    libro = LibroSerializer(read_only=True)
    id_libro = serializers.PrimaryKeyRelatedField(queryset=Libro.objects.all(), source='libro', write_only=True)

    class Meta:
        model = ItemCarrito
        fields = ['id_libro', 'libro', 'cantidad']

    def create(self, validated_data):
        item, created = ItemCarrito.objects.get_or_create(
            usuario=validated_data['usuario'],
            libro=validated_data['libro'],
            defaults={'cantidad': validated_data['cantidad']}
        )
        if not created:
            item.cantidad += validated_data['cantidad'] 
            item.save()
        return item

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
    class Meta:
        model = Reseña
        fields = ['libro', 'usuario', 'comentario', 'fecha_creacion']
