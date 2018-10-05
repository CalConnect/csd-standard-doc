@startuml
@startuml Csd_CsdStandardDocument
/'
Diagram:        Csd_CsdStandardDocument
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
> 31/08/2018
    - Enumeration type CcStatusType has been updated. plus sign as a prefix has been removed from all items in the enumeration
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

class CcStandardDocument {
    +bibdata: CcBibliographicItem
    +foreword: HierarchicalSection[0..1]
    +introduction: HierarchicalSection[0..1]
    +sections: ClauseSection[1..*]
    +annex: AnnexSection[0..*]
}

class BibliographicItem <<Standard Document>>{

}

class CcBibliographicItem {
    +committee: CcTechnicalCommittee
    +type: CcDocumentType
}

class CcTechnicalCommittee{
    +type: CcTechnicalCommitteeType
    +name: String
}

class DocumentStatus{
    +status: CcStatusType
}

class TextElement <<Basicdoc>>{

}

class Keyword{

}

class BasicBlock <<Basicdoc>>{

}

class FigureBlock{
    +source: String[0..1]
    +name: LocalizedString[0..1]
    +image: Image[0..1]
    +figure: Subfigure[0..*]
    +definitions: DefinitionList[0..1]
    +pre: String[0..1]
    +footnotes: ReferenceToIdWithParagraphElement[0..*]
}

enum CcStatusType <<enumeration>>{
    proposal
    working_draft
    committee_draft
    final_draft
    published
    withdrawn
}

enum CcDocumentType <<enumeration>>{
    code
    presentation
    proposal
    standard
    report
}

enum CcTechnicalCommitteeType <<enumeration>>{
    technical
    provisional
}

'******* CLASS RELATIONS **********************************************
StandardDocument <|-- CcStandardDocument
BibliographicItem <|-- CcBibliographicItem
CcStandardDocument <-- CcBibliographicItem

CcBibliographicItem <-- CcTechnicalCommittee
CcBibliographicItem <-- CcDocumentType
CcBibliographicItem <-- DocumentStatus

CcTechnicalCommittee <-- CcTechnicalCommitteeType
DocumentStatus <-- CcStatusType

TextElement <|-- Keyword

BasicBlock <|-- FigureBlock

@enduml
@enduml
