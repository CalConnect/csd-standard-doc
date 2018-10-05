@startuml
@startuml IsoDoc_IsoBibliographicItem
/'
Diagram:        IsoDoc_IsoBibliographicItem
DateCreate:     22/08/2018
Description:    Metanorma IsoDoc is a family of document models intended to represent ISO Standards and similarly structured standards,
                based on the Metanorma StandardDocument ("StanDoc") and BasicDocument ("BasicDoc") models.
                It is used to abstract the automated generation of standard documents in various formats from well-defined authoring tools;
                and to validate the structural conformance of authored standards to specifications.
                The standards currently modelled via Metanorma IsoDoc are:

                - ISO Standards
                - CSD Standards
                - Chinese Standards (GB and family)

                The base Metanorma StandardDocument model includes information common to all standards in scope of IsoDoc.
                Models for individual standards are derived from the base model as subclasses, permitting changes in cardinality of attributes,
                and changes in their type.

                Models it depends on include:

                - Relaton Bibliography models: BibModels
                - BasicDoc models: BasicDoc
                - Metanorma StandDoc models: StanDoc

                Below, we show the UML diagrams for the base model and for ISO. The CSD, GB diagrams are shown on their own respective pages.
                The document models are expressed as UML and as RelaxNG Compact (RNC) grammars; see discussion under Grammars.
                This repository contains the RNC grammars for the base Standard Document model, ISO Standards, CSD and China Standards.

                The document models are currently used by Asciidoctor-based authoring tools for standards,
                which convert Asciidoctor source to XML representations of the document models, and validate the XML generated against the RNC schemas:

                - https://github.com/riboseinc/asciidoctor-iso
                - https://github.com/riboseinc/asciidoctor-csd
                - https://github.com/riboseinc/asciidoctor-gb

                They are also used by tools that render those XML representations of the document models, into HTML and Microsoft Word:

                - https://github.com/riboseinc/isodoc
                - https://github.com/riboseinc/asciidoctor-csd (inheriting from isodoc)
                - https://github.com/riboseinc/asciidoctor-gb (inheriting from isodoc)

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
class BibliographicItem <<Bibliography>> {

}

class IsoBibliographicItem{
    +docIdentifier: IsoDocumentId
    +title: IsoLocalizedTitle
    +type: IsoDocumentType
    +status: IsoDocumentStatus
    +editorialgroup: IsoProjectgroup
    +ics: Ics[1..*]
    +source: TypeUri[0..*]
    +abstract: FormattedString[0..*]
    +allParts: boolean[0..1]
}

class IsoDocumentId{
    +tcDocumentNumber: Integer[0..1]
    +projectNumber: Integer[0..1]
    +partNumber: Integer[0..1]
}

class IsoLocalizedTitle{
    +titleIntro: FormattedString[0..*]
    +titleMain: FormattedString[1..*]
    +titlePart: FormattedString[0..*]
}

class IsoDocumentStatus{
    +stage:IsoDocumentStageCodes
    +substage: IsoDocumentSubstageCodes
    +iteration: Integer[0..1]
}

class DocumentStatus <<Bibliography>>{

}

class IsoProjectgroup{
    +technicalCommittee: IsoSubgroup
    +subcommittee: IsoSubgroup[0..1]
    +workgroup: IsoSubgroup[0..1]
    +secretariat: String[0..1]
}

class Organization <<Bibliography>>{

}

class IsoSubgroup{
    +type: String[0..1]
    +number: Integer[0..1]
    +name: String
}

class Ics{
    +code: String
    +text: String[0..1]
}

enum IsoDocumentType <<enumeration>>{
    internationalStandard
    technicalSpecification
    technicalReport
    publiclyAvailableSpecification
    internationalWorkshopAgreement
    guide
}

enum IsoDocumentStageCodes <<enumeration>>{
    00
    10
    20
    30
    40
    50
    60
    90
    95
}

enum IsoDocumentSubstageCodes <<enumeration>>{
    00
    20
    60
    90
    92
    93
    98
    99
}

'******* NOTES ********************************************************
note bottom of Ics: ICS is defined by ISO here:\nhttps://www.iso.org/publication/PUB100033.html

'******* CLASS RELATIONS **********************************************
IsoBibliographicItem -up-|> BibliographicItem

IsoDocumentId --> IsoBibliographicItem
IsoLocalizedTitle --> IsoBibliographicItem
IsoBibliographicItem <-- IsoDocumentType
IsoBibliographicItem <-- IsoDocumentStatus
IsoBibliographicItem <-- Ics
IsoBibliographicItem <-- IsoProjectgroup

DocumentStatus <|-- IsoDocumentStatus

IsoDocumentStatus <-- IsoDocumentStageCodes
IsoDocumentStatus <-- IsoDocumentSubstageCodes

IsoProjectgroup -down-|> Organization

IsoProjectgroup <-- IsoSubgroup

@enduml
@enduml
