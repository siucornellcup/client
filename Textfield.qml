import QtQuick 1.0
import 'colibri'
Image {
    id: textInput
    source: "images/profile/UI_Profile_TextInsert.png"
    width: 353
    height: 57
    z: 100
    property alias text: txt_input.text


    TextInput {
        id: txt_input
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 10
        text: keyboard.text
        font.family:"DroidSans"
        font.pointSize: 16
        horizontalAlignment: TextInput.AlignLeft
        transformOrigin: Item.Center
        activeFocusOnPress: true
        CLKeyboard{
            id: keyboard
            visible: false
            onCancelCLButtonClicked:{keyboard.visible = false}
            onOkCLButtonClicked:{keyboard.visible = false }
            anchors.top: parent.bottom
            anchors.topMargin: 10
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                        keyboard.visible = true
                        textInput.state = 'keyboardTime'
            }                  
        }
    }
    states:[
    State{
        name: 'keyboardTime'
        PropertyChanges {
            target: txt_input
            text: keyboard.text
        }
    }]

}
