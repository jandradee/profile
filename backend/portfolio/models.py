from django.db import models
class profile(models.Model):
    id_profile = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=200)  # Nombre completo
    birth_day = models.DateField()  # Fecha de nacimiento
    GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female'),
    )
    address = models.CharField(max_length=255)  # Dirección
    marital_status = models.CharField(max_length=200)
    website = models.URLField(max_length=200, blank=True)  # Sitio web (opcional)
    email = models.EmailField(max_length=100)  # Correo electrónico
    driver_license = models.CharField(max_length=20, blank=True)  # Licencia de conducir (opcional)
    profilePic = models.ImageField(upload_to='profile_pics/', blank=True)
# Create your models here.

class phone(models.Model):
    id_profile = models.ForeignKey(profile, on_delete=models.CASCADE)
    phone_type = models.CharField(max_length=20, blank=True)
    phone_number = models.DateField()
    Languaje = models.CharField(max_length=200)

class education(models.Model):
    institution = models.CharField(max_length=200)
    start_date = models.DateField()
    end_date = models.DateField() 
    current = models.CharField(max_length=200, blank=True)
    id_profile = models.ForeignKey(profile, on_delete=models.CASCADE)
    Image = models.ImageField(upload_to='education/', blank=True)
    title = models.CharField(max_length=200, blank=True)

class courses(models.Model):
    course_name = models.CharField(max_length=200)
    id_profile = models.ForeignKey(profile, on_delete=models.CASCADE)
    institution_name = models.CharField(max_length=200)
    start_date = models.DateField()
    end_date = models.DateField() 
    lang = models.CharField(max_length=200)
    Image = models.ImageField(upload_to='courses/', blank=True)

class certification(models.Model):
    id_profile = models.ForeignKey(profile, on_delete=models.CASCADE)
    certification_name = models.CharField(max_length=200)
    institution_name = models.CharField(max_length=200)
    start_date = models.DateField()
    end_date = models.DateField() 
    lang = models.CharField(max_length=200)
    exp_date = models.CharField(max_length=200)
    certification_number = models.CharField(max_length=200)
    Image = models.ImageField(upload_to='certifications/', blank=True)

class experience(models.Model):
    id_profile = models.ForeignKey(profile, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    employment_type = models.CharField(max_length=200)
    company_or_organization = models.CharField(max_length=200)
    start_date = models.DateField()
    end_date = models.DateField() 
    address = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    profile_head_line = models.CharField(max_length=255)
    languaje = models.CharField(max_length=200)
    
class volunteering(models.Model):
    id_profile = models.ForeignKey(profile, on_delete=models.CASCADE)
    institution_name = models.CharField(max_length=200)
    start_date = models.DateField()
    end_date = models.DateField() 
    position = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    Image = models.ImageField(upload_to='volunteering/', blank=True)