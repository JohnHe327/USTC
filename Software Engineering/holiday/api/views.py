from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from . import models

# Create your views here.

def loginP (request):
    request.session['is_login'] = False
    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        if username and password:
            try:
                user = models.User.objects.get(name=username)
                if user.password == password:
                    request.session['is_login'] = True
                    request.session['user_name'] = username
                    return redirect('logout')
                else:
                    message = "wrong password!"
            except:
                message = "user does not exist!"
        return render(request, 'login.html', {"message": message})
    return render(request,'login.html')

def register (request):
    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        if username and password:
            try:
                user = models.User.objects.get(name=username)
                message = "user already exists!"
            except:
                models.User.objects.create(name=username, password=password)
                return redirect('login')
        return render(request, 'register.html', {"message": message})
    return render(request,'register.html')

def logout(request):
    request.session['is_login'] = False
    request.session['user_name'] = None
    return redirect('login')

