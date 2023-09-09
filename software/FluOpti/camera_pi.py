import io
import time
import picamera
from FluOpti.base_camera import BaseCamera

camera = picamera.PiCamera()

class Camera(BaseCamera):
    @staticmethod
    def frames():
        # let camera warm up
        time.sleep(2)

        stream = io.BytesIO()
        camera.resolution = (320, 240)
        camera.rotation = 180
        for _ in camera.capture_continuous(stream, 'jpeg', use_video_port=True):
            # return current frame
            stream.seek(0)
            yield stream.read()
            # reset stream for next frame
            stream.seek(0)
            stream.truncate()

    @staticmethod
    def get_pic(route, quality, config):
        camera.resolution = (1920, 1080)
        camera.iso = config['iso']
        camera.framerate = config['frame_rate']
        camera.awb_gains = config['balance']
        camera.shutter_speed = config['exposure']
        time.sleep(2)
        camera.capture(route, quality=quality)
