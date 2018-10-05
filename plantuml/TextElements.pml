@startuml
@startuml TextElements
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

class TextElement{
    +content: LocalizedString[1..*]
}

class MonospaceElement{

}

class EmphasisElement{

}

class SubscriptElement{

}

class StrongElement{

}

class StemElement{
    +stemType: StemType
    +stemValue: StemValue
}

class SuperScriptElement{

}

class StrikeElement{

}

class SmallCapsElement{

}

class StemValue{

}

class MathML{
    +value: MathMLValue
}

class AsciiML{
    +value: String
}

enum StemType <<enumeration>>{
    MathML
    AsciiML
}




'******* CLASS RELATIONS *********************************************
BasicElement <|-down- TextElement

TextElement <|-- MonospaceElement
TextElement <|-- EmphasisElement
TextElement <|-- SubscriptElement
TextElement <|-- StrongElement
TextElement <|-- StemElement

StemElement <-- StemType
StemElement <-- StemValue

StemValue <|-- MathML
StemValue <|-- AsciiML

TextElement <|-- SuperScriptElement
TextElement <|-- StrikeElement
TextElement <|-- SmallCapsElement

@enduml
@enduml
