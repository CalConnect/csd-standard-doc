@startuml
@startuml Lists
/'
Diagram:        Blocks
DateCreate:     28/07/2018
Description:    BasicDocument / SecureDoc is a family of document models that forms the basis of Metanorma IsoDoc (via Metanorma StandardDocument), which is used to represent ISO Standards and similarly structured standards.
                It is also the document model that Selagraph operates on.
                The Relaton Bibliography UML models used in these models are located here: Relaton BibModels.
                BasicDocument itself is a document model that can serve as a transit data structure for document conversion, such as taking input from AsciiDoc or Markdown and converting them into an output format, such as Metanorma IsoDoc

Hystory of changes:
> 22/08/2018
    - diagram configuration updated
    - update of the classes "FigureBlock", "SourcecodeBlock", "FormulaBlock", "TableBlock"
    - new classes are added "Subfigure", "ParagraphsBlock", "List", "ListItem", "UnorderedList", "OrderedList", "DefinitionList", "Definition"
    - new notes are added for "Subfigure"
    - new enumeration are added "OrderedListType"
    - relations between some of the elements in the diagram has been updated
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
class BasicBlock {
    +id: String
    +notes: ParagraphBlock[0..*]
    +contribMetadata: ContributionElementMetadata[0..*]
}

class List{
    +listitem: ListItem[0..*]
}

class Listitem{
    +id: string[0..1]
    +content: ParagraphWithFootnote[0..*]
}

class UnorderedList{

}

class OrderedList{
    +type: OrderedListType
}

class DefinitionList{
    +listitem: Definition[0..*]
}

class Definition{
    +item: TextElement[0..*]
    +definition: ParagraphWithFootnote[0..*]
}

enum OrderedListType <<enumeration>>{
    roman
    alphabet
    arabic
    roman_upper
    alphabet_upper
}


'******* CLASS RELATIONS *********************************************
BasicBlock <|-- List

List <-left- Listitem
List <|-- UnorderedList
List <|-- DefinitionList

DefinitionList <-- Definition

UnorderedList <|-- OrderedList

OrderedList <-- OrderedListType

@enduml
@enduml
