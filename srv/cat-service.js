module.exports = srv => {

    console.log('Service name: ${srv.name} is served at ${srv.path}')
    // Generic Handler
    srv.after('READ', 'Books', xs => {
        console.log(xs)

        /*Custom Logic : Creating problems while opening the Object Page
        const newBooks = []
        xs.forEach(x => {
            if (x.stock > 500)
                x.title = '(10% Off !)' + x.title
            newBooks.push(x);
        });
        console.log(newBooks);
        return newBooks; */
    }) 
}