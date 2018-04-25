import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "sharedFunctions.js" as Functions

//Inhaltsobjekt
BasePage {

    height: parent.height; width: parent.width

    titel: "DMS-App"

    menuButtonsText: [ "zurück" ]

    //Darstellung der Inhalte
    Rectangle {
        id: usersPageView
        height: parent.height
        width: parent.width
        color: "#C0D5E5"

        //Anzeige der Nummern über Delegates
        ListView {
            id: view;
            anchors {top: parent.top; right: parent.right; left: parent.left; bottom: parent.bottom; margins: 2}
            delegate: UsersDelegate{}
            spacing: 4;
            cacheBuffer: 50;
        }

        //Wenn Objekte gezeichnet sind, dann werden Funktionen ausgeführt
        Component.onCompleted: {
            root.visible = true;
            Functions.readUsers();
        }
    }

    onMenuButtonClicked: {
        switch ( buttonIndex ) {
            //Wechsel auf vorige Seite
        case 0: mainStackView.pop(); break;
        default: //console.log("error")
        }
    }
}
