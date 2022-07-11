from django.shortcuts import render, redirect
from django.shortcuts import get_object_or_404
from django.contrib.auth import update_session_auth_hash
from course.models import Pose
from .models import user

# Create your views here.
def login_view(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        getuser = user.objects.filter(username = username, password = password).first()
        if getuser != None:
            request.session['username'] = username
            request.session['password'] = password
            request.session['password'] = password
            request.session['user_id'] = getuser.user_id
            request.session.set_expiry(300)
            if (getuser.role == 0):
                return redirect("/user/userhome/")
            if (getuser.role == 1):
                return redirect("/user/adminhome/")
        else:
            return render(request, 'login.html')
    else:
        return render(request,'login.html')
def logout_view(request):
    del request.session['username']
    del request.session['password']
    del request.session['user_id']
    return redirect("/user/userhome")

#User
def get_home_admin(request, category="idPose"):
    if 'user_id' in request.session:
        print(request.session['username'])
        pose_list = Pose.objects.filter().order_by(category)
        return render(request, 'form_view_moves.html', {'pose_list' : pose_list})
    else:
        return redirect('/user/login')
def get_view_moves(request, category="idPose"):
    pose_list = Pose.objects.filter().order_by(category)
    return render(request, 'form_view_moves.html', {'pose_list' : pose_list})
def get_home_user(request, category="idPose"):
    # print(request.session['user_id'])
    # userid = request.session['user_id']
    pose_list = Pose.objects.filter().order_by(category)
    return render(request, 'userhome.html',{ 'pose_list': pose_list})

def get_register(request):
    return render(request, 'register.html')

def add_register(request):
    if request.method == "POST":
        username = request.POST["username"]
        email = request.POST["email"]
        password = request.POST["password"]
        user = user.objects.create(
                                    username = username,
                                    email = email,
                                    password = password,
                                    )
        user.save()
        return render(request, 'login.html')
    else:
        return render(request, 'register.html')

# def get_home_admin(request, category="pose_id"):
#     pose_list = pose_model.objects.filter().order_by(category)
#     return render(request, 'adminhome.html', {'pose_list' : pose_list})
def detail_view(request):
    if 'user_id' in request.session:
        user_id = request.session['user_id']
        info_user = user.objects.get(user_id=user_id)
        context = {
            'infoUser': info_user
        }
        return render(request, 'account.html', context)
    else:
        return redirect('/user/userhome')


def update_user(request, id):
    info_user = get_object_or_404(user, user_id=id)
    if request.method == 'POST':
        info_user.first_name = request.POST['first_name']
        info_user.last_name = request.POST['last_name']
        info_user.email = request.POST['email']
        info_user.phone = request.POST['phone']
        info_user.address = request.POST['address']
        info_user.date = request.POST['date']
        info_user.save()
    context = {
        'infoUser': info_user,
    }
    return redirect('/user/account-view')


def update_password(request):
    if 'user_id' in request.session:
        user_id = request.session['user_id']
        info_user = get_object_or_404(user, user_id)
        info_user.password = request.POST['newPassword']
        info_user.save()
        context = {
            'infoUser': info_user,
        }
    return redirect('/user/account-view')


def register_view(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        email = request.POST['email']
        getuser = user.objects.filter(username = username, password = password).first()
        if getuser != None:
            return render(request, 'register.html')
        else:
            user = user.objects.create(username=username,password=password,email = email)
            user.save()
            return redirect("/user/login")
    else:
        return render(request, 'register.html')





