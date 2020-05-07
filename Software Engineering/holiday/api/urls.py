from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.loginP, name='login'),
    path('signup/', views.register, name='register'),
    path('logout/', views.logout, name='logout'),
]

