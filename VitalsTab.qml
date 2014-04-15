import QtQuick 1.0

Item {
	id: vitalsTabItem
    visible: true
    anchors.fill: parent
	Image {
		id: img_vitalsTab
		source: "images/tabs/UI_Tab1_tabs.jpg"
		Image {
			id: heightTab
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 47
            source: "images/tab_vitals/UI_Vitals_Tab1.png"

   MouseArea {
       id: mouseArea1
       x: 8
       y: 8
       width: 86
       height: 103
   }

   MouseArea {
       id: mouseArea2
       x: 8
       y: 117
       width: 86
       height: 106
   }

   MouseArea {
       id: mouseArea3
       x: 8
       y: 229
       width: 86
       height: 105
   }

   MouseArea {
       id: mouseArea4
       x: 8
       y: 340
       width: 86
       height: 105
   }

   MouseArea {
       id: mouseArea5
       x: 8
       y: 451
       width: 86
       height: 107
   }
		}

	}
	
}
