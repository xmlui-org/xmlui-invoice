function isDuplicate(name) {
    return existingProducts && existingProducts.value && existingProducts.value.some(p => p.name === name);
}

function startImport(products) {
    console.log('startImport', products.length);
    // Process first item directly with the known products array
    if (products.length > 0) {
        const product = products[0];

        productToImport = JSON.stringify({
            name: product.name,
            description: product.description,
            price: parseFloat(product.price) || 0
        });

        // Set queue to remaining items
        importQueue = products.slice(1);
    }
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
    } else {
        // Import completed, navigate to products page
        delay(500, () => navigate('/products'));
    }
}
