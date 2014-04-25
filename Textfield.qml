import QtQuick 1.0

Image {
    id: textInput
    source: "images/profile/UI_Profile_TextInsert.png"
    width: 353
    height: 57

    property alias text: txt_input.text

    TextInput {
        id: txt_input
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 10
        text: qsTr("Text Input")
        font.family:"DroidSans"
        font.pointSize: 16
        horizontalAlignment: TextInput.AlignLeft
        transformOrigin: Item.Center
    }
}
