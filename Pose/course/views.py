from django.shortcuts import render, redirect
from .models import Pose_history
from rest_framework.response import Response
from rest_framework import status
from .models import Pose
from rest_framework.views import APIView
from rest_framework.renderers import TemplateHTMLRenderer
from django.shortcuts import redirect, render
from django.utils import timezone
from django.shortcuts import get_object_or_404
from django.core.files.storage import FileSystemStorage

# Create your views here.
def get_pose_add(request):
    return render(request, 'form_add_moves.html')
def add_pose(request):
    if request.method == "POST":
        name = request.POST["name"]
        image1 = request.FILES["image1"]
        image2 = request.FILES["image2"]
        image3 = request.FILES["image3"]
        image4 = request.FILES["image4"]
        image5 = request.FILES["image5"]
        image6 = request.FILES["image6"]
        image7 = request.FILES["image7"]
        image8 = request.FILES["image8"]
        image9 = request.FILES["image9"]
        image10 = request.FILES["image10"]

        pose = Pose.objects.create(name = name,
                                        image1 = image1,
                                        image2 = image2,
                                        image3 = image3,
                                        image4 = image4,
                                        image5 = image5,
                                        image6 = image6,
                                        image7 = image7,
                                        image8 = image8,
                                        image9 = image9,
                                        image10 = image10)
        pose.save()
        return render(request, 'form_view_moves.html')
    else:
        return render(request, 'error.html')
def get_history(request):
    # print(request.session['user_id'])
    # userid = request.session['user_id']
    if 'user_id' in request.session:
        list= Pose_history.objects.filter().order_by("id")
        return render(request, 'history-course.html',{ 'list': list})
    else:
        return redirect('/user/userhome')
def detail_view(request,id_pose):
    getpose = Pose.objects.get(idPose = id_pose)
    return render(request,'detail.html',{'getpose':getpose})
def delete_pose(request, id):
    pose = Pose.objects.get(idPose=id)
    pose.delete()
    return render(request, 'form_view_moves.html')


def get_pose_edit(request, id):
    pose = Pose.objects.filter(idPose= id).first()
    return render(request, 'form_edit_moves.html', {'pose':pose})

def edit_pose(request, id):
    if request.method == 'POST':
        pose_id = Pose.objects.get(idPose = id)
        pose_id.name = request.POST["name"]
        pose_id.times = pose_id.times
        pose_id.image1 = request.FILES["image1"]
        pose_id.image2 = request.FILES["image2"]
        pose_id.image3 = request.FILES["image3"]
        pose_id.image4 = request.FILES["image4"]
        pose_id.image5 = request.FILES["image5"]
        pose_id.image6 = request.FILES["image6"]
        pose_id.image7 = request.FILES["image7"]
        pose_id.image8 = request.FILES["image8"]
        pose_id.image9 = request.FILES["image9"]
        pose_id.image10 = request.FILES["image10"]
        pose_id.save()
        return render(request, 'form_view_moves.html')
    else:
        return render(request, 'error.html')
    
def get_pose_find(request):
    if request.method == 'POST':
        find = request.POST["find"]
        if (find != ""):
            pose_list = Pose.objects.filter(name=find)
            return render(request, 'adminhome.html', {'pose_list' : pose_list})
        else:
            pose_list = Pose.objects.filter()
            return render(request, 'adminhome.html', {'pose_list' : pose_list})

def get_pose_search(request):
    if request.method == 'POST':
        search = request.POST["search"]
        if (search == "name"):
            pose_list = Pose.objects.filter().order_by("name")
            return render(request, 'adminhome.html', {'pose_list' : pose_list})
        if (search == "times"):
            pose_list = Pose.objects.filter().order_by("times")
            return render(request, 'adminhome.html', {'pose_list' : pose_list})


# class home_view(APIView):
#     renderer_classes = [TemplateHTMLRenderer]
#     template_name = 'adminhome.html'
#     def get(self, request):
#         queryset = pose.objects.filter().order_by('idPose')
#         serializer_class = PoseSerializer(queryset, many=True)
#         return Response({'serializer' : serializer_class, 'pose_list' : queryset}, status=status.HTTP_200_OK)
#     def post(self, request):
#         serializer = PoseSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response({'serializer' : serializer}, status=status.HTTP_201_CREATED)
#         return Response(status=status.HTTP_400_BAD_REQUEST)

def get_capture_form(request):
    return render(request, 'capture.html')

def save_image(request, category="pose_id"):
    pose_list = pose.objects.filter().order_by(category)
    if request.POST.get('action') == 'create-post':
        image = request.FILES.get('image')
        pose = request.POST.get('pose')# request.FILES used for to get files
        print(pose) 
        print(image.name)
        fs = FileSystemStorage()
        fs.save(image.name, image)
    return render(request, 'capture.html', {'pose_list' : pose_list})




