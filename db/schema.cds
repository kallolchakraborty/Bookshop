namespace my.bookshop;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity Books {
    key ID     : Integer;
        title  : String;
        stock  : Integer;
        // Connecting the two entities: Referencial Contraints
        author : Association to Authors;
}

entity Authors {
    key ID    : Integer;
        name  : String;
        // Navigation Property Binding
        books : Association to many Books
                    on books.author = $self;
}

entity Orders : cuid, managed {
    book     : Association to Books;
    quantity : Integer;
}

