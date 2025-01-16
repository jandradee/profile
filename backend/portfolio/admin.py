from django.contrib import admin
from .models import profile, phone, certification, courses, experience, volunteering, education

# Register your models here.
admin.site.register(profile)
admin.site.register(phone)
admin.site.register(certification)
admin.site.register(courses)
admin.site.register(experience)
admin.site.register(volunteering)
admin.site.register(education)
