import QtQuick 1.0

Image {
    id: diagnosisProgress
    source: 'images/tab_diagnosis/UI_Diagnosis_ProgressShape.png'
    anchors.centerIn: parent
    visible: false
    Image {
        id: diagnosisOkay
        source: 'images/tab_diagnosis/UI_Diagnosis_OkNormal.png'
        y: 70
        x: 176
    }
    Text {
        id: uploadingText
        text: qsTr('Uploading...')
        font.family: 'DroidSans'
        x: 186
        y: -70
        font.pointSize: 22
    }
}