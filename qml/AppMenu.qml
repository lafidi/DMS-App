import QtQuick 2.3

//Definition des Menüs unten - nicht ganz verstanden, einfach aus Vorlesungsunterlagen kopiert
Rectangle {
    id: menuId
    height: parent.implicitHeight; radius: 20; color:"#888888";
    border.color: "#C0D5E5"

    //Möglichkeit, die Texte bzw. Icons Seitenabhängig zu definieren
    property variant buttonsText: []
    property variant buttonsIcons: []
    property int buttonCount: buttonsText.length

    //Signal, wenn Button geklickt wird
    signal buttonClicked( int buttonIndex );

    Row{
        //Baut so viele Button-Objekte, wie benötigt werden
        Repeater {
            model: buttonCount

            //Button besteht aus klickbarem Rechteck mit Text
            Rectangle {
                width: menuId.width/buttonCount
                height: menuId.height
                border.width: 1
                border.color: "#C0D5E5"
                color: "#888888"
                Text{
                    anchors.centerIn: parent
                    text: buttonsText[ index ]
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: buttonClicked( index )
                }
            }
        }
    }
}

