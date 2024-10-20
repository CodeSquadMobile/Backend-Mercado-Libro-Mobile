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
    email = serializers.EmailField(required=True)
    username = serializers.CharField(required=True)
    password = serializers.CharField(write_only=True, min_length=8)

    def create(self, validated_data):
        validated_data['password'] = make_password(validated_data['password'])
        return get_user_model().objects.create(**validated_data)

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
    id_autor = AutorSerializer(read_only=True)  
    id_categoria = CategoriaSerializer(read_only=True)

    class Meta:
        model = Libro
        fields = ('id_libro', 'titulo', 'precio', 'stock', 'descripcion', 'portada', 'id_autor', 'id_categoria')



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
        instance.tipo_tarjeta = validated_data.get('tipo_tarjeta', instance.tipo_tarjeta)
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

class ContactoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contacto
        fields = ['nombre', 'email', 'asunto', 'mensaje']