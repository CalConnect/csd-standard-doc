@startuml
@startuml StandardDoc_Terms
/'
Diagram:        StandardDoc_Terms
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
skinparam nodesep 20
skinparam ranksep 30
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

class ClauseSection{
    +subsections: ClauseSection[0..*]
}

class TermsSection{
    +terms: <<Term>>TermCollection
}

class DefinitionSection{
    +definitions: <<Term>>DefinitionCollection
}

class TermCollection <<Term>> {
    +terms: Term[0..*]
}

class Term <<Term>> {
    +id: String[0..1]
    +preferred: <<BasicDocument>> LocalizedString[1..*]
    +admitted: <<BasicDocument>> LocalizedString[0..*]
    +deprecates: <<BasicDocument>> LocalizedString[0..*]
    +domain: <<BasicDocument>> LocalizedString[0..1]
    +definition: <<BasicDocument>> ParagraphBlock[1..*]
    +note: <<BasicDocument>> ParagraphBlock[0..*]
    +example: <<BasicDocument>> ParagraphBlock[0..*]
    +source: TermSource[0..*]
}

class TermSource <<Term>>{
    +status: TermOriginStatus
    +origin: <<Bibliography>> Citation
    +modification: <<BasicDocument>> ParagraphBlock[0..1]
}

class DefinitionCollection{
    +definitions: Definition[0..*]
}

class Definition <<BasicDocument>>{

}

enum TermSourceStatus <<enumeration>>{
    identical
    modified
}

'******* NOTES ********************************************************
note top of Term: Term modelled according to ISO/IEC Directives 2,\n16.6\nParagraph/TextElement may contain a formula.
note bottom of Definition: Definition modelled according to ISO/IEC\nDirectives 2, 17.\n* Can be a symbol or abbreviation\n* A DefinitionCollection is represented as\n a single clause
note "A TermsSection or DefinitionSection\nis a leaf node - only contain terms\nor symbols/abbreviations. The\ncontent of each solely comes from\nthe terms or symbols/abbreviations." as N2

'******* CLASS RELATIONS **********************************************

ClauseSection <|-- TermsSection
ClauseSection <|-- DefinitionSection

TermsSection --> TermCollection
DefinitionSection --> DefinitionCollection

TermCollection <-- Term
Term <-- TermSource
TermSource <-- TermSourceStatus

DefinitionCollection <-- Definition



@enduml
@enduml
