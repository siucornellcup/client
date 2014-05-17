import QtQuick 1.0

Item{
	id: checkboxContainer
	property alias text: checkText.text
	property bool checked: false

	Image {
	    id: checkbox
	    source: "images/profile/UI_Profile_ConditionsSelect.png"
	    state: 'checkboxUnselected'
	    MouseArea {
	        id: checkMouse
	        anchors.fill: parent
	        onClicked: checkbox.state == 'checkboxUnselected' ? checkbox.state = 'checkboxSelected' : checkbox.state = 'checkboxUnselected'
	    Text {
		    id: checkText
		    anchors.left: parent.right
		    anchors.verticalCenter: parent.verticalCenter
		    text: qsTr("Condition")
		    font.pixelSize: 12
		    font.family:"DroidSans"
		}
	}
	states: [
		State {
			name: 'checkboxSelected'
			PropertyChanges {
				target: checkbox
				source: "images/profile/UI_Profile_ConditionsSelected_Active.png"
			}
			PropertyChanges {
				target: checkboxContainer
				checked: true
			}
		},
		State {
			name: 'checkboxUnselected'
			PropertyChanges {
				target: checkbox
				source: "images/profile/UI_Profile_ConditionsSelect.png"
			}
		}
	]
	}
}