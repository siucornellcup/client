import QtQuick 2.2

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

		Image {
			id: actionsBox
			source: 'images/messages/UI_Messages_ActionsBox.png'
			anchors.right: parent.right
			anchors.rightMargin: 25
			anchors.top: parent.top
			anchors.topMargin: 60
		}		

		Image {
			id: pastEntriesButton
			source: 'images/messages/UI_Messages_ViewPast_Btn.png'
			anchors.top: actionsBox.bottom
			anchors.topMargin: 30
			anchors.horizontalCenter: actionsBox.horizontalCenter
			MouseArea {
				anchors.fill: parent
				onPressed: parent.source = 'images/messages/UI_Messages_ViewPast_Active_Btn.png'
				onReleased: parent.source = 'images/messages/UI_Messages_ViewPast_Btn.png' 
			}
		}

		Image {
			id: moreMessagesIndicator
			source: 'images/messages/UI_Messages_ContinueIndicator.png'
			anchors.verticalCenter: pastEntriesButton.verticalCenter
			anchors.right: pastEntriesButton.left
			anchors.rightMargin: 20
		}

	/*	ListView {
			id: patientListModel
			model: patientListModel
			delegate: Component{
				Image{
					
				}
			}
		}

		CLListbox {
			anchors.fill: parent
			anchors.rightMargin: 300
			anchors.leftMargin: 30
			anchors.topMargin: 60
			
		}
*/
}	
