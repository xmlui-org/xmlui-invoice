function startImport(products) {
    console.log('startImport', products.length);
    // Copy selected products to separate import queue
    importQueue = [...products];
    importNextProduct();
}

function importNextProduct() {
    console.log('importNextProduct', importQueue.length);
    if (importQueue && importQueue.length > 0) {
        const product = importQueue[0];
        
        productToImport = JSON.stringify({
            name: product.name,
            description: product.description,
            price: parseFloat(product.price) || 0
        });
        
        importQueue = importQueue.slice(1);
    }
}

function processNextProduct() {
    console.log('processNextProduct', importQueue.length);
    if (importQueue && importQueue.length > 0) {
        delay(200, () => importNextProduct());
    }
}
