from darkflow.net.build import TFNet
import cv2

options = {"model": "cfg/tiny-yolo-voc-melanoma.cfg", "load": "bin/tiny-yolo-voc.weights", "threshold": 0.3}

tfnet = TFNet(options)

imgcv = cv2.imread("F:\Capstone\darkflow-master\test\training\benign_741.jpg")
result = tfnet.return_predict(imgcv)
print(result)