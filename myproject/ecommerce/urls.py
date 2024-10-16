from django.urls import path, include
from rest_framework import routers
from .views import LoginView, LogoutView, SignupView, UserViewSet, CategoriaViewSet, AutorViewSet, LibroViewSet, \
ItemCarritoViewSet, PedidoViewSet, DireccionViewSet, MetodoPagoViewSet, ReseñaViewSet, ContactoViewSet

router = routers.DefaultRouter()
router.register(r'usuarios', UserViewSet)
router.register(r'categorias', CategoriaViewSet)
router.register(r'autores', AutorViewSet)
router.register(r'libros', LibroViewSet)
router.register(r'carrito', ItemCarritoViewSet)
router.register(r'pedidos', PedidoViewSet)
router.register(r'direcciones', DireccionViewSet)
router.register(r'metodopagos', MetodoPagoViewSet)
router.register(r'resenas', ReseñaViewSet)
router.register(r'contacto', ContactoViewSet)


urlpatterns = [
    path('', include(router.urls)),
    path('auth/login/', LoginView.as_view(), name='auth_login'),
    path('auth/logout/', LogoutView.as_view(), name='auth_logout'),
    path('auth/signup/', SignupView.as_view(), name='auth_signup'),
]