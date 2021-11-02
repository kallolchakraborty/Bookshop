using my.bookshop as my from '../db/schema';

service CatalogService @(impl : 'srv/cat-service.js') {
    // Catalog service for exposing entities which is defined in the schema cds
    @readonly
    entity Books   as projection on my.Books;

    // Specifiying the operations
    @Capabilities : {
        Insertable : false,
        Deletable  : true
    }
    entity Authors as projection on my.Authors;

    entity Orders  as projection on my.Orders;
}
