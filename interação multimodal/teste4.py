import cv2
import mediapipe as mp
import mouse
import math
import pyautogui

def touch(x1,y1,x2,y2):
    a = (x1 - x2)**2 + (y1 - y2)**2
    b = math.sqrt(a)
    if b <= 20:
        return True
    else:
        return False

cap = cv2.VideoCapture(0)
mpHands = mp.solutions.hands
hands = mpHands.Hands()
mpDraw = mp.solutions.drawing_utils

while True:
    success, image = cap.read()
    imageRGB = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image = cv2.flip(image,1)
    imageRGB = cv2.flip(imageRGB,1)
    results = hands.process(imageRGB)

    # checking whether a hand is detected
    if results.multi_hand_landmarks:
        for handLms in results.multi_hand_landmarks: # working with each hand
            cx4 = 0
            cy4 = 0
            cx8 = 0
            cy8 = 0
            for id, lm in enumerate(handLms.landmark):
                h, w, c = image.shape
                cx, cy = int(lm.x * w), int(lm.y * h)

                if id == 12:
                    cv2.circle(image, (cx, cy), 16, (255, 0, 255), cv2.FILLED)
                    if touch(cx,cy,cx8,cy8) and cx8 != 0:
                        cv2.circle(image, (cx, cy), 16, (0, 128, 0), cv2.FILLED)
                        cv2.putText(image,"Scroll", (cx,cy), cv2.FONT_HERSHEY_SIMPLEX, 1, 255)
                        if cy4 > 240:
                            pyautogui.scroll(-1)
                        elif cy4 <= 240:
                            pyautogui.scroll(1)
                if id == 8:
                    cv2.circle(image, (cx, cy), 16, (255, 0, 255), cv2.FILLED)
                    cx8 = cx
                    cy8 = cy
                    if touch(cx,cy,cx4,cy4) and cx4 != 0:
                        cv2.circle(image, (cx, cy), 16, (0, 128, 0), cv2.FILLED)
                        cv2.putText(image,"Click", (cx,cy), cv2.FONT_HERSHEY_SIMPLEX, 1, 255)
                        #mouse.click('left')
                        pyautogui.click()

                    #cv2.putText(image,str(id), (cx,cy), cv2.FONT_HERSHEY_SIMPLEX, 1, 255)
                if id == 4:
                    cv2.circle(image, (cx, cy), 16, (0, 0, 255), cv2.FILLED)
                    #cv2.putText(image,str(id), (cx,cy), cv2.FONT_HERSHEY_SIMPLEX, 1, 255)
                    cx4 = cx
                    cy4 = cy
                    px = (cx * 1919) / 639
                    py = (cy * 1079) / 479
                    #print("Coordenadas",cx,cy)
                    mouse.move(px, py, absolute=True, duration=0.001)


                #(1919, 1079)
            mpDraw.draw_landmarks(image, handLms, mpHands.HAND_CONNECTIONS)
        print("handLms",handLms)

    cv2.imshow("Output", image)
    cv2.waitKey(1)
