import QtQuick 1.0

	Image {
		id: img_vitalsTab
		source: "images/tabs/UI_Tab1_tabs.jpg"
        anchors.fill: parent
		Image {
            id: sensorTabs
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 47
            source: "images/tab_vitals/UI_Vitals_Tab1.png"

           MouseArea {
               id: click_Height
               x: 8
               y: 8
               width: 86
               height: 103
               onClicked: parent.source = "images/tab_vitals/UI_Vitals_Tab1.png"
           }

           MouseArea {
               id: mouseArea2
               x: 8
               y: 117
               width: 86
               height: 106
               onClicked: parent.source = "images/tab_vitals/UI_Vitals_Tab2.png"
           }

           MouseArea {
               id: mouseArea3
               x: 8
               y: 229
               width: 86
               height: 105
               onClicked: parent.source = "images/tab_vitals/UI_Vitals_Tab3.png"
           }

           MouseArea {
               id: mouseArea4
               x: 8
               y: 340
               width: 86
               height: 105
               onClicked: parent.source = "images/tab_vitals/UI_Vitals_Tab4.png"
           }

           MouseArea {
               id: mouseArea5
               x: 8
               y: 451
               width: 86
               height: 107
               onClicked: parent.source = "images/tab_vitals/UI_Vitals_Tab5.png"
           }

   Image {
       id: image1
       x: 23
       y: 50
       source: "images/tab_vitals/UI_Vitals_HeightIcon.png"
   }

   Image {
       id: image2
       x: 27
       y: 147
       source: "images/tab_vitals/UI_Vitals_BloodPressIcon.png"
   }

   Image {
       id: image3
       x: 41
       y: 259
       source: "images/tab_vitals/UI_Vitals_TempIcon.png"
   }

   Image {
       id: image4
       x: 29
       y: 370
       source: "images/tab_vitals/UI_Vitals_WeightIcon.png"
   }

   Image {
       id: image5
       x: 33
       y: 482
       source: "images/tab_vitals/UI_Vitals_StethoIcon.png"
   }
		}

	}

