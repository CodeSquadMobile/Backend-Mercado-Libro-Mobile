from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.exceptions import NotAuthenticated
from django.contrib.auth import authenticate, login, logout
from rest_framework import status, generics
from rest_framework.response import Response 
from rest_framework.views import APIView
from .models import (
    CustomUser,
    Categoria,
    Autor,
    Libro,
    ItemCarrito,
    Pedido,
    Direccion,
    MetodoPago,
    Reseña,
    Contacto
)
from .serializers import (
    UserSerializer,
    CategoriaSerializer,
    AutorSerializer,
    LibroSerializer,
    ItemCarritoSerializer, 
    PedidoSerializer,
    DireccionSerializer,
    MetodoPagoSerializer,
    ReseñaSerializer,
    ContactoSerializer
)
from myproject.ecommerce import serializers


class SignupView(generics.CreateAPIView):
    serializer_class = UserSerializer
    
class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email', None)
        password = request.data.get('password', None)
        user = authenticate(email=email, password=password)

        if user:
            login(request, user)
            return Response(
                UserSerializer(user).data,
                status=status.HTTP_200_OK)
        return Response(
            {'error': 'Invalid Credentials'},
            status=status.HTTP_404_NOT_FOUND)

class LogoutView(APIView):
    def post(self, request):
        logout(request)
        return Response(status=status.HTTP_200_OK)
    
class UserViewSet(viewsets.ModelViewSet):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer

    def destroy(self, request, *args, **kwargs):
        user = self.get_object()
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class CategoriaViewSet(viewsets.ModelViewSet):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class AutorViewSet(viewsets.ModelViewSet):
    queryset = Autor.objects.all()
    serializer_class = AutorSerializer

class LibroViewSet(viewsets.ModelViewSet):
    queryset = Libro.objects.all()
    serializer_class = LibroSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = {
        'titulo': ['icontains'],
        'id_categoria__nombre_categoria': ['exact'],
        'precio': ['lte', 'gte'],
        'stock': ['lte', 'gte'],
    }
    
class DireccionViewSet(viewsets.ModelViewSet):
    queryset = Direccion.objects.all()
    serializer_class = DireccionSerializer

    def get_queryset(self):
        if self.request.user.is_anonymous:
            # Si el usuario no está autenticado, lanzamos la excepción
            raise NotAuthenticated("Usuario no autenticado. Debes iniciar sesión para acceder a esta información.")
        
        # Si el usuario está autenticado, devolvemos las direcciones relacionadas a ese usuario
        return Direccion.objects.filter(usuario=self.request.user)   

class MetodoPagoViewSet(viewsets.ModelViewSet):
    queryset = MetodoPago.objects.all()
    serializer_class = MetodoPagoSerializer

    def get_queryset(self):
        return MetodoPago.objects.filter(usuario=self.request.user) 

class ItemCarritoViewSet(viewsets.ModelViewSet):
    queryset = ItemCarrito.objects.all()

    def get_queryset(self):
        return ItemCarrito.objects.filter(usuario=self.request.user)

    def perform_create(self, serializer):
        serializer.save(usuario=self.request.user) 

class PedidoViewSet(viewsets.ModelViewSet):
    serializer_class = PedidoSerializer
    queryset = Pedido.objects.all()

    def get_queryset(self):
        return Pedido.objects.filter(usuario=self.request.user)  

    def perform_create(self, serializer):
        carrito_items = ItemCarrito.objects.filter(usuario=self.request.user)
        if carrito_items.exists():
            total = sum(item.libro.precio * item.cantidad for item in carrito_items)
            pedido = serializer.save(usuario=self.request.user, total=total)
            carrito_items.delete()  
            return pedido
        raise serializers.ValidationError("El carrito está vacío.")

class ReseñaViewSet(viewsets.ModelViewSet):
    queryset = Reseña.objects.all()
    serializer_class = ReseñaSerializer

    def perform_create(self, serializer):
        serializer.save(usuario=self.request.user)

class ContactoViewSet(viewsets.ModelViewSet):
    queryset = Contacto.objects.all()
    serializer_class = ContactoSerializer