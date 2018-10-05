@startuml
@startuml IsoDoc_IsoStandardDocument
/'
Diagram:        IsoDoc_IsoStandardDocument
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
class StandardDocument <<StandardDocument>> {

}

class IsoStandardDocument {
    +bibdata: IsoBibliographicItem
    +preface: IsoPreface
    +sections: ClauseSection[1..*]
    +annex: IsoAnnexSection[0..*]
    +termSources: <<Bibliography>> Citation[0..*]
}

class IsoPreface{
    +foreword: BasicSection
    +introduction: ClauseSection[0..1]
}

class AnnexSection <<StandardDocument>>{

}

class IsoAnnexSection{
    +appendix: ClauseSection[0..*]
}

'******* NOTES ********************************************************
note "'termSource' points to\nother ISO Documents where\nthis document inherit their\nTerms and Definition /\nSymbols /\n Abbreviations" as N1

'******* CLASS RELATIONS **********************************************
StandardDocument <|-- IsoStandardDocument
IsoStandardDocument <-- IsoPreface

AnnexSection <|-- IsoAnnexSection

@enduml
@enduml
