import QtQuick 1.0
Item {
		anchors.fill: parent

    Textfield {
        id: heightTextField
        width: 125
        text: ""
        Text {
        	id: instruction
            text: 'Enter Height'
            anchors.top: parent.top
            anchors.topMargin: -20
        }
        Text {
        	id: units
            text: "cm"
            anchors.left: parent.right
            anchors.leftMargin: 15
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            font.pointSize: 16             
		}
   }
}