import QtQuick 1.0
import 'colibri'
Image {
		id: messagesBackground
		source: 'images/messages/UI_Messages_back.png'
		z: 100
		anchors.centerIn: parent
		
		Text {
			id: updates
			text: "Updates"
			font.pointSize: 18
			font.family:"DroidSans"
			color: "#404040"
			anchors.left: parent.left
			anchors.leftMargin: 40
			anchors.top: parent.top
			anchors.topMargin: 20
		}
		Text {
			id: actions
			text: "Actions"
			font.pointSize: 18
			font.family:"DroidSans"
			color: "#404040"
			anchors.right: parent.right
			anchors.rightMargin: 175
			anchors.top: parent.top
			anchors.topMargin: 20
		}
		Image {
			id: dropdown
			anchors.right: parent.right
			anchors.top: parent.top
			anchors.rightMargin: 300
			anchors.topMargin: 19
			source: "images/messages/UI_PatientPage_DropDown_Closed.png"
		}
		
		CLListbox {
			anchors.fill: parent
			anchors.rightMargin: 300
			anchors.leftMargin: 30
			anchors.topMargin: 60
		}
}	
