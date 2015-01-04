import QtQuick 1.0

Image {
    id: symptomsBack

    property alias genderImg: bodyImage.source
    property alias genderSmlImg: smallBodyImage.source
    anchors.centerIn: parent
    visible: false
    source: 'images/tab_symptoms/UI_Symptoms_back.png'
    
    Image {
        id: bodyBox
        source: 'images/tab_symptoms/UI_Symptoms_BodyBox.png'
        x: 30
        y: 85
        Item {
           id: bodyPartSelectItem
           Image {
              id: headSelect
              source: 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
              x: 102.5
              y: 28
              z: 1
              MouseArea {
                  anchors.fill: parent
                  onPressed: headSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Selected.png'
                  onReleased: headSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
                  onClicked: {symptomsDropText.text = qsTr('Head'); symptomsDrop.state = 'symptomsDropClosed'}

              }
           }
           Image {
               id: breastSelect
               source: 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
               x: 125
               y: 120
               z: 1
               MouseArea {
                   anchors.fill: parent
                   onPressed: breastSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Selected.png'
                   onReleased: breastSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
                   onClicked: {symptomsDropText.text = qsTr('Breast'); symptomsDrop.state = 'symptomsDropClosed'}

               }
           }
           Image {
               id: stomachSelect
               source: 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
               x: 102.5
               y: 190
               z: 1
               MouseArea {
                   anchors.fill: parent
                   onPressed: stomachSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Selected.png'
                   onReleased: stomachSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
                   onClicked: {symptomsDropText.text = qsTr('Stomach'); symptomsDrop.state = 'symptomsDropClosed'}

               }
           }
           Image {
               id: handSelect
               source: 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
               x: 182.5
               y: 235
               z: 1
               MouseArea {
                   anchors.fill: parent
                   onPressed: handSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Selected.png'
                   onReleased: handSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
                   onClicked: {symptomsDropText.text = qsTr('Hand'); symptomsDrop.state = 'symptomsDropClosed'}

               }
           }
           Image {
               id: genitalSelect
               source: 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
               x: 102.5
               y: 220
               z: 1
               MouseArea {
                   anchors.fill: parent
                   onPressed: genitalSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Selected.png'
                   onReleased: genitalSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
                   onClicked: {symptomsDropText.text = qsTr('Genital'); symptomsDrop.state = 'symptomsDropClosed'}

               }
           }
           Image {
               id: kneeSelect
               source: 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
               x: 85
               y: 320
               z: 1
               MouseArea {
                   anchors.fill: parent
                   onPressed: kneeSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Selected.png'
                   onReleased: kneeSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
                   onClicked: {symptomsDropText.text = qsTr('Knee'); symptomsDrop.state = 'symptomsDropClosed'}

               }
           }
           Image {
               id: footSelect
               source: 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
               x: 78.5
               y: 405
               z: 1
               MouseArea {
                   anchors.fill: parent
                   onPressed: footSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Selected.png'
                   onReleased: footSelect.source = 'images/tab_symptoms/UI_Symptoms_BodyPart_Select.png'
                   onClicked: {symptomsDropText.text = qsTr('Foot'); symptomsDrop.state = 'symptomsDropClosed'}

               }
           }

           Image {
               id: bodyImage
               source: {patient.p_gender == 'Male' ?  'images/tab_symptoms/UI_Symptoms_MaleFrontLarge.png' : 'images/tab_symptoms/UI_Symptoms_FemaleFrontLarge.png' }
               x: 10
               y: 25

           }
           Image {
               id: smallBodyImage
               source: {patient.p_gender == 'Male' ? 'images/tab_symptoms/UI_Symptoms_MaleBackSmall.png' : 'images/tab_symptoms/UI_Symptoms_FemaleBackSmall.png' }
               x: 175
               y: 12
           }

        }
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
        font.family: "DroidSans"
        x: 30
        y: 45
        font.pointSize: 22
    }
    Text {
        id: symptomsText
        text: qsTr("Symptoms")
        font.family: "DroidSans"      
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
        z: 7
        Text {
            id: symptomsDropText
            text: qsTr('Body Part')
        	font.family: "DroidSans"
        	font.pointSize: 16            
            x: 15
            y: 12
        }
        Item {
            id: symptomsTextItem
            visible: false
            z:8
            Text {
                id: headText
                text: qsTr('Head'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                font.family: "DroidSans"
        		font.pointSize: 16
                x: 3
                y: 40
                width: 157
                height: 20
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Head')
                    }
                }
            }
            Text {
                id: breastText
                text: qsTr('Breast'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                x: 3
                y: 60
                width: 157
                height: 20
             	font.family: "DroidSans"
        		font.pointSize: 16           
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Breast')
                    }
                }
            }
            Text {
                id: stomachText
                text: qsTr('Stomach'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                x: 3
                y: 82.5
                width: 157
                height: 20
                font.family: "DroidSans"
        		font.pointSize: 16
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Stomach')
                    }
                }
            }
            Text {
                id: handText
                text: qsTr('Hand'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                x: 3
                y: 105
            	font.family: "DroidSans"
        		font.pointSize: 16            
                width: 157
                height: 20
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Hand')
                    }
                }
            }
            Text {
                id: genitalText
                text: qsTr('Genitals'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                x: 3
                y: 127.5
        		font.family: "DroidSans"
        		font.pointSize: 16                
                width: 157
                height: 20
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Genitals')
                    }
                }
            }
            Text {
                id: kneeText
                text: qsTr('Knee'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                x: 3
                y: 150
        		font.family: "DroidSans"
        		font.pointSize: 16                
                width: 157
                height: 20
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Knee')
                    }
                }
            }
            Text {
                id: footText
                text: qsTr('Foot'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                x: 3
                y: 172.5
                width: 157
                height: 20
        		font.family: "DroidSans"
        		font.pointSize: 16                
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Foot')
                    }
                }
            }
            Text {
                id: text3
                text: qsTr('Other'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                x: 3
                y: 195
                width: 157
                height: 20
        		font.family: "DroidSans"
        		font.pointSize: 16                
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Other')
                    }
                }
            }
            Text {
                text: qsTr('Non-Specific'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                x: 3
                y: 222.5
                width: 157
                height: 20
       	 		font.family: "DroidSans"
        		font.pointSize: 16                
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        symptomsDrop.state = 'symptomsDropClosed'
                        symptomsDropText.text = qsTr('Non-Specific')
                    }
                }
            }

        }
        Item {
            id: symptomsDrop_1Item
            visible: false
            Image {
                id: symptomsDrop_1
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                y: 80
                x: 3
            }
            Image {
                id: symptomsDrop_2
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                x: 3
                y: 125
            }
            Image {
                id: symptomsDrop_3
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                x: 3
                y: 170
            }
        }

        MouseArea {
            id: symptomsDropMouse
            width: 168
            height: 34
            onClicked: symptomsDrop.state == 'symptomsDropClosed' ? symptomsDrop.state = 'symptomsDropOpen' : symptomsDrop.state = 'symptomsDropClosed'
        }
        states: [
            State {
                name: 'symptomsDropClosed'
                PropertyChanges {
                    target: symptomsDrop
                    source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
                }
                PropertyChanges {
                    target: symptomsDrop_1Item
                    visible: false
                }
                PropertyChanges {
                    target: symptomsTextItem
                    visible: false
                }
            },
            State {
                name: 'symptomsDropOpen'
                PropertyChanges {
                    target: symptomsDrop
                    source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown.png'
                }
                PropertyChanges {
                    target: symptomsDrop_1Item
                    visible: true
                }
                PropertyChanges {
                    target: symptomsTextItem
                    visible: true
                }
            }

        ]
    }
    Image {
        id: downDetailArrow
        source: 'images/tab_symptoms/UI_Symptoms_ArrowSmall.png'
        x: 415
        y: 170
        z: 6
    }
    Image {
        id: symptomsDrop2
        source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
        x: 345
        y: 200
        z: 5
        MouseArea {
            id: symptomsDrop2Mouse
            anchors.fill: parent
            onClicked: symptomsDrop2.state == 'symptomsDropClosed' ? symptomsDrop2.state = 'symptomsDropOpen' : symptomsDrop2.state = 'symptomsDropClosed'
        }
        Text {
            id: symptomsDrop2Text
            text: qsTr('Type of Pain')
            x: 15
            y: 12
            font.family: "DroidSans"
        	font.pointSize: 16 
        }

        Item {
            id: symptomsTextItem2
            visible: false
            z:6
            Text {
                id: text1
                text: qsTr('Thermal'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                height: 20
                width: 157
                x: 3
                y: 40
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop2.state = 'symptomsDropClosed'; symptomsDrop2Text.text = qsTr('Thermal')}
                }
            }
            Text {
                id: text2
                text: qsTr('Mechanical'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                height: 20
                width: 157
                x: 3
                y: 65
                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onClicked: {symptomsDrop2.state = 'symptomsDropClosed'; symptomsDrop2Text.text = qsTr('Mechanical')}
                }
            }
            Text {
                text: qsTr('Chemical'); horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                height: 20
                width: 157
                x: 3
                y: 90
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop2.state = 'symptomsDropClosed'; symptomsDrop2Text.text = qsTr('Chemical')}
                }
            }
        }


        states: [
            State {
                name: 'symptomsDropClosed'
                PropertyChanges {
                    target: symptomsDrop2
                    source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
                }
                PropertyChanges {
                    target: symptomsTextItem2
                    visible: false
                }
            },
            State {
                name: 'symptomsDropOpen'
                PropertyChanges {
                    target: symptomsDrop2
                    source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown.png'
                }
                PropertyChanges {
                    target: symptomsTextItem2
                    visible: true
                }
            }

        ]
    }
    Image {
        id: downDetailArrow2
        source: 'images/tab_symptoms/UI_Symptoms_ArrowSmall.png'
        x: 415
        y: 255
        z: 4
    }
    Image {
        id: symptomsDrop3
        source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
        x: 345
        y: 285
        z: 3
        MouseArea {
            id: symptomsDrop3Mouse
            anchors.fill: parent
            onClicked: symptomsDrop3.state == 'symptomsDropClosed' ? symptomsDrop3.state = 'symptomsDropOpen' : symptomsDrop3.state = 'symptomsDropClosed'
        }
        Text {
            id: durationText
            text: qsTr('Duration');
            x: 15
            y: 12
            font.pointSize: 16
        }
        Item {
            id: symptomsDrop_3Item
            visible: false
            Image {
                id: symptomsDrop3_1
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                y: 80
                x: 3
            }
            Image {
                id: symptomsDrop3_2
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                x: 3
                y: 102.5
            }
        }
        Item {
            id: durationTextItem
            visible: false
            Text {
                height: 20
                width: 157
                x: 3
                y: 40
                text: qsTr('1 day'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop3.state = 'symptomsDropClosed'; durationText.text = qsTr('1 day')}
                }
            }
            Text {
                height: 20
                width: 157
                x: 3
                y: 60
                text: qsTr('1 week'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop3.state = 'symptomsDropClosed'; durationText.text = qsTr('1 week')}
                }
            }
            Text {
                height: 20
                width: 157
                x: 3
                y: 82.5
                text: qsTr('1 month'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop3.state = 'symptomsDropClosed'; durationText.text = qsTr('1 month')}
                }
            }
            Text {
                height: 20
                width: 157
                x: 3
                y: 105
                text: qsTr('3 months'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop3.state = 'symptomsDropClosed'; durationText.text = qsTr('3 months')}
                }
            }
            Text {
                height: 25
                width: 157
                x: 3
                y: 125
                text: qsTr('6 months'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop3.state = 'symptomsDropClosed'; durationText.text = qsTr('6 months')}
                }
            }
            Text {
                height: 20
                width: 157
                x: 3
                y: 155
                text: qsTr('1 year'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop3.state = 'symptomsDropClosed'; durationText.text = qsTr('1 year')}
                }
            }
        }
        states: [
            State {
                name: 'symptomsDropClosed'
                PropertyChanges {
                    target: symptomsDrop3
                    source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
                }
                PropertyChanges {
                    target: symptomsDrop_3Item
                    visible: false
                }
                PropertyChanges {
                    target: durationTextItem
                    visible: false
                }
            },
            State {
                name: 'symptomsDropOpen'
                PropertyChanges {
                    target: symptomsDrop3
                    source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown.png'
                }
                PropertyChanges {
                    target: symptomsDrop_3Item
                    visible: true
                }
                PropertyChanges {
                    target: durationTextItem
                    visible: true
                }
            }

        ]
    }
    Image {
        id: downDetailArrow3
        source: 'images/tab_symptoms/UI_Symptoms_ArrowSmall.png'
        x: 415
        y: 340
        z: 2
    }
    Image {
        id: symptomsDrop4
        source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
        x: 345
        y: 370
        z: 1
        MouseArea {
            id: symptomsDrop4Mouse
            anchors.fill: parent
            onClicked: symptomsDrop4.state == 'symptomsDropClosed' ? symptomsDrop4.state = 'symptomsDropOpen' : symptomsDrop4.state = 'symptomsDropClosed'
        }

        states: [
            State {
                name: 'symptomsDropClosed'
                PropertyChanges {
                    target: symptomsDrop4
                    source: 'images/tab_symptoms/UI_Profile_Ethnicity_Closed.png'
                }
                PropertyChanges {
                    target: symptomsDrop4Item
                    visible: false
                }
                PropertyChanges {
                    target: painTextItem
                    visible: false
                }
            },
            State {
                name: 'symptomsDropOpen'
                PropertyChanges {
                    target: symptomsDrop4
                    source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown.png'
                }
                PropertyChanges {
                    target: symptomsDrop4Item
                    visible: true
                }
                PropertyChanges {
                    target: painTextItem
                    visible: true
                }
            }

        ]
        Item {
            id: symptomsDrop4Item
            visible: false
            Image {
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                x: 3
                y: 80
            }
            Image {
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                x: 3
                y: 120
            }
            Image {
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                x: 3
                y: 160
            }
            Image {
                source: 'images/tab_symptoms/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                x: 3
                y: 182.5
            }
        }
        Text {
            id: painText
            font.pointSize: 16
            x: 12
            y: 12
            text: qsTr('Pain Magnitude')
        }

        Item {
            id: painTextItem
            visible: false
            z: 1
            Text {
                text: qsTr('1'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 37.5
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('1')}
                }
            }
            Text {
                text: qsTr('2'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 60
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('2')}
                }
            }
            Text {
                text: qsTr('3'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 80
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('3')}
                }
            }
            Text {
                text: qsTr('4'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 100
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('4')}
                }
            }
            Text {
                text: qsTr('5'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 120
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('5')}
                }
            }
            Text {
                text: qsTr('6'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 140
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('6')}
                }
            }
            Text {
                text: qsTr('7'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 160
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('7')}
                }
            }
            Text {
                text: qsTr('8'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 182.5
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('8')}
                }
            }
            Text {
                text: qsTr('9'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 205
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('9')}
                }
            }
            Text {
                text: qsTr('10'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                x: 3
                y: 235
                width: 157
                height: 25
                MouseArea {
                    anchors.fill: parent
                    onClicked: {symptomsDrop4.state = 'symptomsDropClosed'; painText.text = qsTr('10')}
                }
            }
        }
    }
    Image {
        id: addCurrentButton
        source: 'images/tab_symptoms/UI_Symptoms_AddCurrentBtn_Normal.png'
        x: 740
        y: 480
    }



    Image {
        id: reverseArrow
        source: 'images/tab_symptoms/UI_Symptoms_Rotate.png'
        x: 207
        y: 117
        MouseArea {
            id: reverseArrowMouse
            anchors.fill: parent
            onClicked: {
                genderSelector.gender == 'Male' ? (reverseArrow.state == 'maleBackIsLarge' ? reverseArrow.state = 'maleFrontIsLarge' : reverseArrow.state = 'maleBackIsLarge') : (reverseArrow.state == 'femaleBackIsLarge' ? reverseArrow.state = 'femaleFrontIsLarge' : reverseArrow.state = 'femaleBackIsLarge')
            }
        }
        states: [
            State {
                name: 'maleBackIsLarge'
                PropertyChanges {
                    target: bodyImage
                    source: 'images/tab_symptoms/UI_Symptoms_MaleBackLarge.png'
                }
                PropertyChanges {
                    target: smallBodyImage
                    source: 'images/tab_symptoms/UI_Symptoms_MaleFrontSmall.png'
                }
            },
            State {
                name: 'maleFrontIsLarge'
                PropertyChanges {
                    target: bodyImage
                    source: 'images/tab_symptoms/UI_Symptoms_MaleFrontLarge.png'
                }
                PropertyChanges {
                    target: smallBodyImage
                    source: 'images/tab_symptoms/UI_Symptoms_MaleBackSmall.png'
                }
            },
            State {
                name: 'femaleBackIsLarge'
                PropertyChanges {
                    target: bodyImage
                    source: 'images/tab_symptoms/UI_Symptoms_FemaleBackLarge.png'
                }
                PropertyChanges {
                    target: smallBodyImage
                    source: 'images/tab_symptoms/UI_Symptoms_FemaleFrontSmall.png'
                }
            },
            State {
                name: 'femaleFrontIsLarge'
                PropertyChanges {
                    target: bodyImage
                    source: 'images/tab_symptoms/UI_Symptoms_FemaleFrontLarge.png'
                }
                PropertyChanges {
                    target: smallBodyImage
                    source: 'images/tab_symptoms/UI_Symptoms_FemaleBackSmall.png'
                }
            }

        ]
    }

}
