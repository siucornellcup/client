import QtQuick 2.2

Image {
    id: backTabs
    source: "images/tabs/UI_Tab1_tabs.jpg"
    anchors.fill: parent





    Row {

        Tabtext {text: "Nurse"; x: 49; y: 25}

        Tabtext {text: "Profile"; x: 251; y: 25}

        Tabtext {text: "Vitals"; x: 470; y: 25}

        Tabtext {text: "Symptoms"; x: 670; y: 25}

        Tabtext {text: "Diagnosis"; x: 870; y: 25}

    }

    MouseArea {
        id: profileTabMouse
        x: 203
        y: 8
        width: 201
        height: 60
        onClicked: {
            pageLoader.source = "PatientTab.qml"
            backTabs.source = "images/tabs/UI_Tab2_tabs.jpg"
        }
    }

    MouseArea {
        id: vitalsTabMouse
        x: 410
        y: 8
        width: 202
        height: 60
        onClicked: {
            backTabs.source = "images/tab_vitals/UI_Tab3_tabs.jpg"
            //pageLoader.source = "VitalsTab.qml"
        }
    }

    MouseArea {
        id: symptomsTabMouse
        x: 618
        y: 8
        width: 203
        height: 60
        onClicked: {
            backTabs.source = "images/tab_symptoms/UI_Tab4_tabs.jpg"
            //pageLoader.source = "Symptoms.qml"
        }
    }

    MouseArea {
        id: diagnosisTabMouse
        x: 827
        y: 8
        width: 189
        height: 60
        onClicked: {
            backTabs.source = "images/tab_diagnosis/UI_Tab5_tabs.jpg"
            //pageLoader.source = "DiagnosisTab.qml"
        }
    }

    MouseArea {
        id: nurseTabMouse
        x: 0
        y: 8
        width: 197
        height: 60
        onClicked: {
            backTabs.source = "images/tabs/UI_Tab1_tabs.jpg"
            //pageLoader.source = "nursePortal"
        }
    }

    Loader {
        id: pageLoader
        x: 50
        y: 100
    }


}

