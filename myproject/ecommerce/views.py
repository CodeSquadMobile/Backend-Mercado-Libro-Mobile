from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from django.contrib.auth import authenticate, login, logout
from rest_framework import status, generics
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import IsAuthenticated
from .permissions import IsSelfOrAdmin
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


class SignupView(generics.CreateAPIView):
    serializer_class = UserSerializer

    def create(self, request, *args, **kwargs):
        response = super().create(request, *args, **kwargs)
        user = CustomUser.objects.get(email=request.data['email'])
        refresh = RefreshToken.for_user(user)
        return Response({
            'user_id': user.id,  # Agrega el user_id aquí
            'refresh': str(refresh),
            'access': str(refresh.access_token),
            'user': UserSerializer(user).data
        }, status=status.HTTP_201_CREATED)

class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email', None)
        password = request.data.get('password', None)
        user = authenticate(email=email, password=password)

        if user:
            login(request, user)
            refresh = RefreshToken.for_user(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'user': UserSerializer(user).data
            }, status=status.HTTP_200_OK)
        return Response({'error': 'Invalid Credentials'}, status=status.HTTP_404_NOT_FOUND)


class LogoutView(APIView):
    def post(self, request):
        logout(request)
        return Response(status=status.HTTP_200_OK)

class UserViewSet(viewsets.ModelViewSet):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated, IsSelfOrAdmin]

    # Método personalizado para eliminar un usuario
    def destroy(self, request, *args, **kwargs):
        user = self.get_object()
        if user == request.user or request.user.is_staff: 
            user.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        else:
            return Response({'error': 'No tienes permiso para eliminar esta cuenta'}, status=status.HTTP_403_FORBIDDEN)
    
    # Acción personalizada para obtener el usuario autenticado
    @action(detail=False, methods=['get'], permission_classes=[IsAuthenticated])
    def me(self, request):
        serializer = self.get_serializer(request.user)
        return Response(serializer.data)


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
        'categoria__nombre_categoria': ['exact'],
        'precio': ['lte', 'gte'],
        'stock': ['lte', 'gte'],
    }
    
class DireccionViewSet(viewsets.ModelViewSet):
    queryset = Direccion.objects.all()
    serializer_class = DireccionSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Direccion.objects.filter(usuario=self.request.user)  

class MetodoPagoViewSet(viewsets.ModelViewSet):
    queryset = MetodoPago.objects.all()
    serializer_class = MetodoPagoSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return MetodoPago.objects.filter(usuario=self.request.user) 

class ItemCarritoViewSet(viewsets.ModelViewSet):
    queryset = ItemCarrito.objects.all()
    serializer_class = ItemCarritoSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return ItemCarrito.objects.filter(usuario=self.request.user)

    def perform_create(self, serializer):
        libro = serializer.validated_data['libro']
        cantidad = serializer.validated_data['cantidad']
        usuario = self.request.user

        # Verificar si el item ya existe en el carrito
        item, created = ItemCarrito.objects.get_or_create(
            usuario=usuario,
            libro=libro,
            defaults={'cantidad': cantidad}
        )

        if not created:
            # Si ya existe, actualizar la cantidad
            item.cantidad += cantidad
            item.save()
        else:
            # Si no existe, decrementar el stock y guardar el nuevo item
            if libro.stock < cantidad:
                raise serializers.ValidationError("No hay suficiente stock disponible.")
            libro.stock -= cantidad
            libro.save()
            serializer.save(usuario=usuario)

class PedidoViewSet(viewsets.ModelViewSet):
    serializer_class = PedidoSerializer
    queryset = Pedido.objects.all()
    permission_classes = [IsAuthenticated]

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
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(usuario=self.request.user)

class ContactoViewSet(viewsets.ModelViewSet):
    queryset = Contacto.objects.all()
    serializer_class = ContactoSerializer
