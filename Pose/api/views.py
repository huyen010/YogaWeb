from urllib import response
from attr import s
from django.http import JsonResponse
from django.shortcuts import render
from rest_framework.response import Response
from api.serializers import PoseSerializer
from course.models import Pose
from rest_framework import status
from rest_framework.decorators import api_view
from .serializers import PoseSerializer
# Create your views here.
@api_view(["GET","POST"])
def Poses(request):
    if request.method == 'GET':
        pose = Pose.objects.all()
        serializer = PoseSerializer(pose,many =True)
        return Response(serializer.data,status = status.HTTP_200_OK)
    elif request.method == 'POST':
        serializer = PoseSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status = status.HTTP_201_CREATED)
        return Response(status = status.HTTP_400_BAD_REQUEST)
@api_view(["GET","PUT","DELETE"])
def PoseByID(request,id):
    try:
        pose = Pose.objects.get(id=id)
    except Pose.DoesNotExist:
        return Response(status = status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = PoseSerializer(pose)
        return Response(serializer.data)
    elif request.method == 'PUT':
        serializer = PoseSerializer(pose,data = request.data)
        if serializer.is_valid():
            serializer.save()
            return response(serializer)
        return Response(status=status.HTTP_400_BAD_REQUEST)
    else:
        pose.delete()
        return Response(status = status.HTTP_200_OK)
        