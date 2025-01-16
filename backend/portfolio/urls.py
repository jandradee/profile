from django.urls import path,include
from rest_framework import routers
from .views import profileViewSet


router = routers.DefaultRouter()
router.register('profile',  profileViewSet)


urlpatterns = [
    path('', include(router.urls)), 
    path('api/', include(router.urls))
]




