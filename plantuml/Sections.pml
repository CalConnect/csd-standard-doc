@startuml
@startuml Sections
/'
Diagram:        Sections
DateCreate:     28/07/2018
Description:    BasicDocument / SecureDoc is a family of document models that forms the basis of Metanorma IsoDoc (via Metanorma StandardDocument), which is used to represent ISO Standards and similarly structured standards.
                It is also the document model that Selagraph operates on.
                The Relaton Bibliography UML models used in these models are located here: Relaton BibModels.
                BasicDocument itself is a document model that can serve as a transit data structure for document conversion, such as taking input from AsciiDoc or Markdown and converting them into an output format, such as Metanorma IsoDoc

Hystory of changes:
> 22/08/2018
    - diagram configuration updated
    - update of the class "BasicSection"
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
class BasicSection {
    +title: TextElement[0..*]
    +id: String[0..1]
    +blocks: BasicBlock[0..*]
    +notes: ParagraphBlock[0..*]
}

class HierarchicalSection{
    +subsections: BasicSection[0..*]
}

class ContentSection{

}

class ReferencesSection{
    +references: <<Bibliography>> BibliographicItem[0..*]
}


'******* CLASS RELATIONS *********************************************
BasicSection <|-- HierarchicalSection
HierarchicalSection <|-- ContentSection
BasicSection <|-- ReferencesSection

@enduml
@enduml
