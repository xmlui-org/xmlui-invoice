CREATE TABLE clients (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      phone TEXT NOT NULL,
      address TEXT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE products (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT,
      price DECIMAL(10, 2) NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
CREATE TABLE invoice_lineitems (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT,
      quantity INTEGER  NOT NULL,
      price DECIMAL(10, 2) NOT NULL
  );
CREATE TABLE invoices (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      invoice_number TEXT NOT NULL UNIQUE,
      client_id INTEGER NOT NULL,
      issue_date DATE NOT NULL,
      due_date DATE NOT NULL,
      status TEXT NOT NULL CHECK(status IN ('draft', 'sent', 'paid')),
      notes TEXT,
      total DECIMAL(10, 2) NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (client_id) REFERENCES clients(id)
  );
CREATE TABLE invoice_items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      invoice_id INTEGER NOT NULL,
      product_id INTEGER NOT NULL,
      description TEXT,
      quantity INTEGER NOT NULL,
      price DECIMAL(10, 2) NOT NULL,
      amount DECIMAL(10, 2) NOT NULL,
      FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
      FOREIGN KEY (product_id) REFERENCES products(id)
  );
