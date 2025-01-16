from rest_framework import serializers
from .models import profile, phone, certification, courses, experience, volunteering

class profileSerializer(serializers.ModelSerializer):
    class Meta:
        model = profile # this is the model that is being serialized
        #fields = ('fullname', 'user_id')
        fields = '__all__'

class phoneSerializer(serializers.ModelSerializer):
    class Meta:
        model = phone
        fields = '__all__'

class certificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = certification
        fields = '__all__'

class coursesSerializer(serializers.ModelSerializer):
    class Meta:
        model = courses
        fields = '__all__'

class experienceSerializer(serializers.ModelSerializer):
    class Meta:
        model = experience
        fields = '__all__'

class volunteeringSerializer(serializers.ModelSerializer):
    class Meta:
        model = volunteering
        fields = '__all__'  