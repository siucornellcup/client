import QtQuick 1.0

//Item {
//	id: tab_symptoms

	    Image {
        id: symptomsBack
        anchors.centerIn: parent
        visible: false
        source: 'images/tab_symptoms/UI_Symptoms_back.png'
	        Image {
	            id: bodyBox
	            source: 'images/tab_symptoms/UI_Symptoms_BodyBox.png'
	            x: 30
	            y: 85
	        }
	        Image {
	            id: backBox
	            source: 'images/tab_symptoms/UI_Symptoms_BackBox.png'
	            y: 85
	            x: 193
	        }
	        Image {
	            id: symptomsBox
	            source: 'images/tab_symptoms/UI_Symptoms_Box.png'
	            y: 85
	            x: 700
	        }
	        Text {
	            id: selectBodyPartText
	            text: qsTr("Select a Body Part")
	            x: 30
	            y: 45
	            font.pointSize: 22
	        }
	        Text {
	            id: symptomsText
	            text: qsTr("Symptoms")
	            x: 700
	            y: 45
	            font.pointSize: 22
	        }
	        Image {
	            id: rightDetailArrow
	            source: 'images/tab_symptoms/UI_Symptoms_ArrowLarge.png'
	            x: 300
	            y: 115
	        }
	        Image {
	            id: symptomsDrop
	            source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
	            x: 345
	            y: 115
	            MouseArea {
	                id: symptomsDropMouse
	                anchors.fill: parent
	                //onClicked: page.state == 'symptomsDropClosed' ? page.state = 'symptomsDropOpen' : page.state = 'symptomsDropClosed'
	            }
	        }
	        Image {
	            id: downDetailArrow
	            source: 'images/tab_symptoms/UI_Symptoms_ArrowSmall.png'
	            x: 415
	            y: 170
	        }
	        Image {
	            id: symptomsDrop2
	            source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
	            x: 345
	            y: 200
	        }
	        Image {
	            id: downDetailArrow2
	            source: 'images/tab_symptoms/UI_Symptoms_ArrowSmall.png'
	            x: 415
	            y: 255
	        }
	        Image {
	            id: symptomsDrop3
	            source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
	            x: 345
	            y: 285
	        }
	        Image {
	            id: downDetailArrow3
	            source: 'images/tab_symptoms/UI_Symptoms_ArrowSmall.png'
	            x: 415
	            y: 340
	        }
	        Image {
	            id: symptomsDrop4
	            source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
	            x: 345
	            y: 370
	        }
	        Image {
	            id: addCurrentButton
	            source: 'images/tab_symptoms/UI_Symptoms_AddCurrentBtn_Normal.png'
	            x: 740
	            y: 480
	        }
	        Image {
	            id: bodyImage
	            source: 'images/tab_symptoms/UI_Symptoms_MaleFrontLarge.png'
	            x: 40
	            y: 110
	        }
	        Image {
	            id: smallBodyImage
	            source: 'images/tab_symptoms/UI_Symptoms_MaleBackSmall.png'
	            x: 205
	            y: 97
	        }
	        Image {
	            id: reverseArrow
	            source: 'images/tab_symptoms/UI_Symptoms_Rotate.png'
	            x: 207
	            y: 117
	        }
    }
//}