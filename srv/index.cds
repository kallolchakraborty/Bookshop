// It will override all CDS file
// To take the definitions from the catalog services not from the stats-services
using from './catalog-service';

// Starting annotating Odata services: entities, services for the Fiori UIs

// Annotation the Books entity inside the Catalog Services
// All the annotations used here is for the UI section
annotate CatalogService.Books with @(UI : {
    Identification  : [{Value : title}],
    SelectionFields : [title], // For adding the title as the selection field on the screen
    LineItem        : [ // For the column visibility
        {Value : ID},
        {Value : title},
        {Value : author.name}, // Extending by navigation property outside the Books entity
        {Value : author_ID},
        {Value : stock}
    ],
    HeaderInfo      : { // Over annotation for the Object Page
        TypeName       : '{i18n>Book}',
        TypeNamePlural : '{i18n>Books}',
        Title          : {Value : title},
        Description    : {Value : author.name}
    }
});

annotate CatalogService.Books with {
    ID     @title : '{i18n>ID}'  @UI.HiddenFilter;
    title  @title : '{i18n>Title}';
    author @title : '{i18n>AuthorID}';
    stock  @title : '{i18n>Stock}';
}

annotate CatalogService.Authors with {
    ID   @title : '{i18n>ID}';
    name @title : '{i18n>AuthorName}';    
}
