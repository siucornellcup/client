import QtQuick 1.0

// Clicked should act as the signal for when the button is pressed
Image {
    id: button
    source: "images/profile/UI_Profile_Save_Btn.png"
    signal clicked
    MouseArea {
        id: buttonMouse
        anchors.fill: parent
        onPressed: saveButton.source = "images/profile/UI_Profile_Save_Active_Btn.png"
        onReleased: saveButton.source = "images/profile/UI_Profile_Save_Btn.png"
        onClicked: {
            parent.clicked()
        }
    }
}

