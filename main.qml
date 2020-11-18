import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import ArcNet 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Loader")
    id: root

    ListView {
        id: lview
        anchors.fill: parent
        model: ldata
        clip: true
        ScrollBar.vertical: ScrollBar {
            id: verticalBar
            anchors.right: parent.right
            anchors.top: parent.top
            policy: ScrollBar.AlwaysOn
        }
        delegate: Rectangle {
            border.color: "pink"
            border.width: 1
            width: root.width
            height: root.height * .5
            id: rect
            Text {
                text: name
                anchors.centerIn: parent
                font.pointSize: 24
            }
            Loader {
                id: loader
                focus: true
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log(link)
                        loader.source = link
                    }
                }
            }
        }
    }

    ListModel {
        id: ldata
        ListElement {
            name: "Temperature"
            link: "http://10.0.0.228:3000/foo.qml"
        }
        ListElement {
            name: "Washer"
            link: "http://10.0.0.228:3000/foo2.qml"
        }
        ListElement {
            name: "Dryer"
            link: "http://10.0.0.228:3000/foo3.qml"
        }
        ListElement {
            name: "A/C"
            link: "http://10.0.0.228:3000/foo4.qml"
        }
        ListElement {
            name: "Security"
            link: "http://10.0.0.228:3000/foo5.qml"
        }
    }


    /*Rectangle {
        width: 150
        height: 150
        anchors.left: rect1.right
        border.color: "green"
        border.width: 1
        id: rect2
        Loader {
            id: loader2
            focus: true
            anchors.fill: parent
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    loader2.source = "http://10.0.0.228:3000/foo2.qml"
                }
            }
        }
    }

    Rectangle {
        anchors.top: rect1.bottom
        border.color: "blue"
        border.width: 1
        height: 150
        width: 150
        id: rect3
        Loader {
            id: loader3
            focus: true
            anchors.fill: parent
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    loader3.source = "http://10.0.0.228:3000/foo3.qml"
                }
            }
        }
    }

    Rectangle {
        border.color: "red"
        border.width: 1
        height: 150
        width: 150
        id: rect4
        anchors.top: rect2.bottom
        anchors.left: rect3.right
        Loader {
            id: loader4
            focus: true
            anchors.fill: parent
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    loader4.source = "http://10.0.0.228:3000/foo4.qml"
                }
            }
        }
    }

    Rectangle {
        height: 150
        width: 150
        anchors.top: rect3.bottom
        anchors.left: rect1.left
        anchors.leftMargin: 75
        border.color: "yellow"
        border.width: 1
        id: rect5
        Loader {
            id: loader5
            focus: true
            anchors.fill: parent
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    loader5.source = "http://10.0.0.228:3000/foo2/main.qml"
                }
            }
        }
    }*/
}
