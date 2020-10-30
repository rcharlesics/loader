import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    id: root

    Rectangle {
        anchors.top: parent
        border.color: "pink"
        border.width: 1
        Loader {
            id: loader1
            focus: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader1.source = "KeyReader.qml"
            }
        }
    }

    Keys.onPressed: {
        console.log("Captured:", event.text)
    }

    Rectangle {
        border.color: "green"
        border.width: 1
        Loader {
            id: loader2
            focus: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader2.source = "KeyReader.qml"
            }
        }
    }

    Rectangle {
        border.color: "blue"
        border.width: 1
        Loader {
            id: loader3
            focus: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader3.source = "KeyReader.qml"
            }
        }
    }

    Rectangle {
        border.color: "green"
        border.width: 1
        Loader {
            id: loader4
            focus: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader4.source = "KeyReader.qml"
            }
        }
    }

    Rectangle {
        border.color: "yellow"
        border.width: 1
        Loader {
            id: loader5
            focus: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader5.source = "KeyReader.qml"
            }
        }
    }
}
