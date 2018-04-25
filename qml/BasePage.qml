import QtQuick 2.3

//Standart-Werte für Inhaltsseite
Item {
    id: basePage
    height: parent.height
    width: parent.width
    visible:false

    //Standart-Titel etc.
    property string titel: "default titel"
    property variant menuButtonsText: [ "back", "next" ]
    property variant menuButtonsIcons: [ "qml/defaultImage1.png", "qml/defaultImage2.png" ]
    signal menuButtonClicked( int buttonIndex )
}

