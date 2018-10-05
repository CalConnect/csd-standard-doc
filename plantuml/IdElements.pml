@startuml
@startuml IdElements
/'
Diagram:        IdElements
DateCreate:     28/07/2018
Description:    BasicDocument / SecureDoc is a family of document models that forms the basis of Metanorma IsoDoc (via Metanorma StandardDocument), which is used to represent ISO Standards and similarly structured standards.
                It is also the document model that Selagraph operates on.
                The Relaton Bibliography UML models used in these models are located here: Relaton BibModels.
                BasicDocument itself is a document model that can serve as a transit data structure for document conversion, such as taking input from AsciiDoc or Markdown and converting them into an output format, such as Metanorma IsoDoc

Hystory of changes:
> 22/08/2018
    - diagram configuration updated
    - new classes are added "Bookmark"
    - classes are removed/commented "Figure", "Subfigure", "List", "UnorderedList", "DefinitionList", "OrderedList", "Definition"
    - enumerations are removed/commented "OrderedListType"
    - notes are added for "Image"
    - some of the relations between the elements are updated
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

class IdElement{
    +id: String
}

class Image{
    +source: Uri
    +imageType: ImageType
    +height[0..1]: Integer | "auto"
    +width[0..1]: Integer | "auto"
}

class Bookmark{

}

/'
class Figure{
    +source: String[0..1]
    +name: LocalizedString[0..1]
    +note: ParagraphWithFootnote[0..*]
    +figure: Subfigure[0..*]
    +definitions: DefinitionList[0..1]
    +image: Image[0..1]
    +footnotes: ReferenceToldWithParagraphElement[0..*]
}

class Subfigure{

}

class List{
    +listItem
}

class UnorderedList{
    +listItem: ParagraphWithFootnote[0..*]
}

class DefinitionList{
    +listItem: Definition[0..*]
}

class OrderedList{
    +type: OrderedListType
}

class Definition{
    +term: LocalizedString
    +definition: ParagraphWithFootnote[0..*]
}
'/

enum ImageType <<enumeration>>{
    SVG
    JPEG
    GIF
    PNG
    PDF
}

/'
enum OrderedListType <<enumeration>>{
    roman
    alphabet
    arabic
    roman_upper
    alphabet_upper
}
'/

'******* NOTES *******************************************************
note right of IdElement : The `IdElement` itself acts as a reference point,\nsuch as in a SourcecodeBlock for\ncallout references (the IdElement is the location),\nand for delimiting ReviewComment start/end places.
'note bottom of Subfigure : Subfigures and images\nonly occur within figures

'******* CLASS RELATIONS *********************************************
BasicElement <|-- IdElement

IdElement <|-- Image
IdElement <|-- Bookmark

Image <-- ImageType


/'
IdElement <|-- Figure
IdElement <|-- List

Figure <|-- Subfigure

List <|-- UnorderedList
List <|-- DefinitionList

DefinitionList <-- Definition

UnorderedList <|-- OrderedList

OrderedList <-- OrderedListType
'/

@enduml
@enduml
