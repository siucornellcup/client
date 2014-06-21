import QtQuick 2.2

Item {
    id: genderSelectItem
    property string gender: "Male"
    signal sendGender(string gender)
    Image {
        id: genderSelection
        x: 37
        y: 222
        opacity: 1
        source: "images/profile/UI_Profile_Gender_Btn.png"

        MouseArea {
            id: maleSelect
            width: 69
            height: 63
            onClicked: {
                genderSelectItem.state = 'maleSelected'
                symptomsTab.genderImg = 'images/tab_symptoms/UI_Symptoms_MaleFrontLarge.png'
                symptomsTab.genderSmlImg = 'images/tab_symptoms/UI_Symptoms_MaleFrontSmall.png'
            }
        }

        MouseArea {
            id: femaleSelect
            width: 69
            height: 63
            anchors.top: parent.top
            anchors.left: maleSelect.right
            onClicked: {
                genderSelectItem.state = 'femaleSelected'
                symptomsTab.genderImg = 'images/tab_symptoms/UI_Symptoms_FemaleFrontLarge.png'
                symptomsTab.genderSmlImg = 'images/tab_symptoms/UI_Symptoms_FemaleFrontSmall.png'
            }

        }
    }
    Image {
        id: genderFemaleSelected
        x: 103
        y: 223
        width: 72
        height: 63
        opacity: 1
        visible: false
        source: "images/profile/UI_Profile_Gender_Active_Btn.png"
    }
    Image {
        id: genderMaleSelected
        x: 39
        y: 223
        width: 72
        height: 63
        source: "images/profile/UI_Profile_Gender_Active_Btn.png"
    }
    Image {
        id: male
        x: 59
        y: 238
        width: 32
        height: 32
        opacity: 1
        source: "images/profile/UI_Profile_Gender_Male.png"
    }
    Image {
        id: female
        x: 128
        y: 235
        width: 22
        height: 37
        opacity: 1
        source: "images/profile/UI_Profile_Gender_Female.png"
    }    

    states: [
        State {
                name: 'femaleSelected'
                PropertyChanges {
                    target: genderFemaleSelected
                    visible: true
                }
                PropertyChanges {
                    target: genderMaleSelected
                    visible: false
                }
                PropertyChanges{
                    target: genderSelectItem
                    gender: "Female"
                }               
        },
        State {
                name: 'maleSelected'
                PropertyChanges {
                    target: genderMaleSelected
                    visible: true
                }
                PropertyChanges {
                    target: genderFemaleSelected
                    visible: false
                }
                PropertyChanges{
                    target: genderSelectItem
                    gender: "Male"
                }
        }
    ]  
}
