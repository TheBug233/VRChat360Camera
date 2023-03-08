# What's this?
This is a very useful prefab, it can capture 360° panorama video of any scene in VRChat, yes now it also supports binocular 3D360°!
## How does it work?
This prefab captures 6 viewports up, down, left, right, front and back with a common camera, and uses a shader to synthesize the final image, and finally outputs it to another camera. Of course, 3D requires two viewing angles and 12 viewports, so your computer needs to have a powerful graphics card (such as NVIDIA 4090...  
## How can I use?
First of all, you need an avatar, you can model it yourself, or buy it from BOOTH, in short, this prefab cannot work without the avatar, or you can make it a meaningless avatar that can only be used for video recording ( To be precise, VRChat is not just a game, but a social software, no one likes to play around the camera)  
### Preconditions
#### This prefab will only convert the PC screen into a panoramic screen when using VR, so it will not affect the normal game of the player.
* If you need to record monocular 2D360° video, it is recommended to create a 7680x3840 virtual display with the [virtual display program](www.amyuni.com/downloads/usbmmidd_v2.zip), and then set VRChat to start on the virtual display.   
If your computer configuration is not capable of this resolution, you can change the resolution to 5.7k (5760x2880), 4k (4096x2048), 2k (2160x1080), etc.   
according to the actual situation, and you need to keep the ratio of vertical and horizontal pixels at 2:1  
* If you need to record binocular 3D 360° video, it is recommended to create a 7680x7680 virtual display with a [virtual display program]](www.amyuni.com/downloads/usbmmidd_v2.zip), and then set VRChat to start on the virtual display.   
If your computer configuration is not capable of this resolution, you can change the resolution to 5.1k (5120x5120), 4k (4096x4096), 2k (2160x2160), etc.   
according to the actual situation, and you need to keep the ratio of vertical and horizontal pixels at 1:1.  
For binocular 3D, I don't recommend using a resolution lower than 5120, the picture will be very bad.
* To save performance, you can record with NVIDIA Geforce experience, recording with it takes almost no additional resources. Other graphics cards can use the programs that come with the graphics card. In addition, you can also use OBS, but please note that if you need to record video with a resolution exceeding 4096x4096, please do not use H.264, you can use P2 or P1 preset HEVC or AV1, and the bit rate is directly set to 99999Kbps.
* Limited by the rtmp protocol, in most cases you will not be able to live broadcast HEVC-encoded video streams, but there are still a few manufacturers that use self-developed and modified rtmp live programs and bind them to the platform.
### Tips for modification in Unity
After downloading from [release](https://github.com/TheBug233/VRChat360Camera/releases) you will get these two folders:  
![image](https://user-images.githubusercontent.com/33407430/223650382-5cc89dc9-9fd6-449b-a2f9-b4ed485b9ae4.png)  
Drag and drop the camera prefab you want to add to the avatar into the avatar  
![image](https://user-images.githubusercontent.com/33407430/223650939-3f18a421-4744-4f38-b641-336796146004.png)  
Create a new empty GameObject, add the native camera component of unity, change the depth to 100, modify the projection to orthographic, the size is 0.1, clipping planes near is 0, far is 0.3  
![image](https://user-images.githubusercontent.com/33407430/223652642-7a62200e-87c1-42c9-a892-6a45cf06d091.png)  
(In VRChat, setting the depth of the camera to 100 will cover the PC screen)  
After that, you need to adjust the distance between the GameObject and the PanoramaCore prefab to ensure that the camera in the GameObject is fully covered by the panorama  
![image](https://user-images.githubusercontent.com/33407430/223656434-c046029f-b658-495b-9a02-49fdd216e625.png)  
  
#### Now, a basic VRChat panorama recording tool has been created. Next, let your imagination run free and bind this panorama core to anything that can follow you or be easily controlled!
I have two good examples here:
* [PFC.DroneKit](https://github.com/brandonvdongen/PFC.DroneKit) A Free VRChat Drone
* [VRChat 三人称カメラ](https://booth.pm/zh-cn/items/3896031) A Free VRChat third person camera
***
All of the above are prohibited for commercial use, and secondary sales are prohibited, enjoy!
