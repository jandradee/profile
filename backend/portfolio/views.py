from rest_framework import viewsets
from .serializers import profileSerializer
from .models import profile

class profileViewSet(viewsets.ModelViewSet):
    queryset = profile.objects.all()
    serializer_class = profileSerializer