@startuml
@startuml StandardDoc_StandardDocument
/'
Diagram:        StandardDoc_StandardDocument
DateCreate:     22/08/2018
Description:    Metanorma StandardDocument ("StanDoc") is a family of document models that forms the basis of Metanorma IsoDoc, which is used to represent
                ISO Standards and similarly structured standards. It itself is an instantiation of BasicDocument (BasicDoc)
                It is one of the document models that Selagraph operates on.
                Metanorma StandardDocument itself is a document model can form the basis of multiple standard document types, including:

                - ISO Standards
                - CSD Standards
                - Chinese Standards (GB and family)

                The Relaton Bibliography UML models used within these models are located here: Relaton BibModels

Hystory of changes:
> DD/MM/YYYY
    -
    -
'/

'******* CONFIGURATION ************************************************
skinparam classAttributeIconSize 0
skinparam Dpi 150
skinparam Monochrome true
skinparam LineType ortho
hide circle
/' skinparam CircledCharacterRadius 0 '/
/' skinparam CircledCharacterFontSize 0 '/
skinparam Default {
TextAlignment center
FontName Helvetica
}
skinparam Class {
AttributeIconSize 0
BackgroundColor White
FontStyle bold
StereotypeFontSize 10
}
skinparam Rectangle {
BackgroundColor White
FontStyle bold
FontSize 11
StereotypeFontSize 10
}
skinparam Object {
BackgroundColor White
FontStyle bold
FontSize 11
StereotypeFontSize 10
}

skinparam Entity {
StereotypeFontSize 10
}

'******* CLASS DEFINITION *********************************************
class BasicDocument <<BasicDocument>> {

}

class StandardDocument {
    +preface: StandardHierarchicalSection[0..*]
    +sections: StandardHierarchicalSection[1..*]
    +annex: StandardHierarchicalSection[0..*]
    +bibliography: StandardReferencesSection[0..*]
}

'******* NOTES ********************************************************

'******* CLASS RELATIONS **********************************************
BasicDocument <|-- StandardDocument

@enduml
@enduml
