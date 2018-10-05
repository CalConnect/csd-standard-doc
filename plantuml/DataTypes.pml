@startuml
@startuml DataTypes
/'
Diagram:        DataTypes
DateCreate:     28/07/2018
Description:    BasicDocument / SecureDoc is a family of document models that forms the basis of Metanorma IsoDoc (via Metanorma StandardDocument), which is used to represent ISO Standards and similarly structured standards.
                It is also the document model that Selagraph operates on.
                The Relaton Bibliography UML models used in these models are located here: Relaton BibModels.
                BasicDocument itself is a document model that can serve as a transit data structure for document conversion, such as taking input from AsciiDoc or Markdown and converting them into an output format, such as Metanorma IsoDoc

Hystory of changes:
> 22/08/2018
    - diagram configuration updated
    - notes are updated for "FormattedString"
    - some relations between the elements are changed
    - new hidden relations are created
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
class LocalizedString {
    +language: Iso639Code[0..*]
    +script: Iso15924Code[0..*]
    +content: String
}

class Uri <<dataType>> {

}

class String <<primitiveType>> {

}

class FormattedString {
    +format: StringFormat = "plain"
}

class Iso8601DateTime <<dataType>> {

}

class Iso15924Code <<dataType>> {

}

class Iso639Code <<dataType>> {

}

class Iso10118Oid <<dataType>> {

}

class Iso14888Oid <<dataType>> {

}

enum StringFormat <<enumeration>> {
    plain
    html
    docbook
    tei
    asciidoc
    markdown
    standarddoc
    isodoc
}


'******* NOTES *******************************************************
note bottom of Iso10118Oid: Hash algorithm
note bottom of Iso14888Oid: Signature algorithm
note bottom of StringFormat: The coresponding MIME types,\ndefaults to "text/plain"\n(docbook / asciidoc / isdoc\nare not registered types yet)


'******* CLASS RELATIONS *********************************************
LocalizedString <|-- FormattedString
FormattedString <-- StringFormat

@enduml
@enduml
