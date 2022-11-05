import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Dialogs
import QtQuick.Controls.Imagine 2.3
/* Here you need to follow the instruction
For Qt5.15.x --> import QtQuick.Dialogs 1.3
For Qt6.x.x -->  import QtQuick.Dialogs
Note : I am using Qt6.3.x so i imported --> import QtQuick.Dialogs
*/
ApplicationWindow {
    visible: true
    width: 400
    height: 600
    minimumWidth: 400
    minimumHeight: 600
    title:  qsTr("blogs.thearticleof.com")
    Label{
        text: qsTr("blogs.thearticleof.com")
        font.pixelSize: 34
        color: "grey"
        opacity: 0.5
        rotation: 360-75
        anchors.centerIn: parent
        anchors.topMargin: 200
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.topMargin: 10
        ListView{
            id : mListView
            Layout.fillWidth: true
            Layout.fillHeight: true

            model : myModel
            delegate:RowLayout{
                width: parent.width
                spacing: 10
                Layout.margins: 10
                TextField{
                    text : names
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    onEditingFinished: {
                        console.log("Editing finished, new text is :"+ text + " at index :" + index)
                        model.names = text //The roles here are defined in model class

                    }
                }

                SpinBox{
                    id : mSpinbox
                    editable: true
                    Layout.fillWidth: true
                    onValueChanged: {
                        model.age = value;
                    }
                    Component.onCompleted: {
                        mSpinbox.value = model.age
                    }
                }
                Rectangle{
                    width : 30
                    height: 30
                    radius: width/2
                    color: model.favoriteColor
                    Layout.rightMargin: 10
                    MouseArea{
                        anchors.fill: parent
                        ColorDialog{
                            id: colorDialog
                            title: "Please choose a color"
                            onAccepted: {
                                console.log("You choose: " + colorDialog.color)
                                model.favoriteColor = colorDialog.color
                            }
                            onRejected: {
                                console.log("Canceled")

                            }
                        }
                        onClicked: {
                            colorDialog.open()

                        }
                    }
                }
            }
        }

        RowLayout{
            width : parent.width

            Button{
                Layout.fillWidth: true
                height: 50
                text : "Add Person";
                highlighted: true
                onClicked: {
                    input.openDialog()
                }
                InputDialog{
                    id : input
                    onInputDialogAccepted: {
                        console.log("Here in main, dialog accepted");
                        console.log( " names : " + personNames + " age :" + personAge)
                        myModel.addPerson(personNames,personAge)
                    }
                }


            }
            Button{
                Layout.fillWidth: true
                height: 50
                highlighted: true
                text : "Remove Last";
                onClicked: {
                    myModel.removeLastPerson()
                }
            }
        }
    }

}
