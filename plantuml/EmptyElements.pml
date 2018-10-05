@startuml
@startuml EmptyElements
/'
Diagram:        TextElements
DateCreate:     28/07/2018
Description:    BasicDocument / SecureDoc is a family of document models that forms the basis of Metanorma IsoDoc (via Metanorma StandardDocument), which is used to represent ISO Standards and similarly structured standards.
                It is also the document model that Selagraph operates on.
                The Relaton Bibliography UML models used in these models are located here: Relaton BibModels.
                BasicDocument itself is a document model that can serve as a transit data structure for document conversion, such as taking input from AsciiDoc or Markdown and converting them into an output format, such as Metanorma IsoDoc

Hystory of changes:
> 22/08/2018
    - diagram configuration updated
    - new classes are added "MonospaceElement"
    - some relations between elements are updated
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
class BasicElement {
    +contribMetadata: ContributionElementMetadata[0..*]
}

class PageBreakElement{

}

class LineBreakElement{

}

class HorizontalRuleElement{

}

'******* NOTES *******************************************************
note "* `LinkBreakElement` is `<br>`\n* `HorizontalRuleElement` is `<hr>`\n* `PageBreakElement` only works in page layout\n(e.g., PDF, Word), not in flow layouts (e.g., HTML)" as N1


'******* CLASS RELATIONS *********************************************
BasicElement <|-up- PageBreakElement
BasicElement <|-left- LineBreakElement
BasicElement <|-right- HorizontalRuleElement

@enduml
@enduml
