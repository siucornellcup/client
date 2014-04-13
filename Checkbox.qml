import QtQuick 1.0


Item{
id: checkboxContainer
property alias text: checkText.text

	Image {
	    id: checkbox
	    source: "images/profile/UI_Profile_ConditionsSelect.png"
	    MouseArea {
	        id: checkMouse
	        anchors.fill: parent
	        onClicked: parent.source = "images/profile/UI_Profile_ConditionsSelected_Active.png"
	    }
	    Text {
	    id: checkText
	    anchors.left: parent.right
	    anchors.verticalCenter: parent.verticalCenter
	    text: qsTr("Condition")
	    font.pixelSize: 12
	    font.family:"DroidSans"
		}
	}
}