from attr import field
from rest_framework.serializers import ModelSerializer 
from course.models import Pose
class PoseSerializer(ModelSerializer):
    class Meta:
        model = Pose
        fields = ('idPose','name','times','image1','image2','image3','image4','image5','image6','image7','image8','image9','image10','advantage','excepts','exercise')
