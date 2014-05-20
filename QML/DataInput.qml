import QtQuick 1.0
Item {

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

    Image {
        source: "images/buttons/Save_Btn.png"
        anchors.left: heightTextField.right
        anchors.leftMargin: 60
        anchors.verticalCenter: heightTextField.verticalCenter
        anchors.verticalCenterOffset: -4
    }

}