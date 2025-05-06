const fs = require('fs');
const path = require('path');

// --- Helper Functions ---
const randomInt = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;

const randomFloat = (min, max, decimals = 2) => {
  const value = Math.random() * (max - min) + min;
  return parseFloat(value.toFixed(decimals));
};

const randomDate = (start, end) => {
  const startDate = start || new Date(2022, 0, 1);
  const endDate = end || new Date();
  return new Date(startDate.getTime() + Math.random() * (endDate.getTime() - startDate.getTime()));
};

const escapeString = (str) => str.replace(/'/g, "''");

const randomChoice = (arr) => arr[Math.floor(Math.random() * arr.length)];

const generatePhone = () => `${randomInt(100, 999)}-${randomInt(100, 999)}-${randomInt(1000, 9999)}`;

// --- Sample Data ---
const companyNames = [
  "Acme Corp", "Globex Corporation", "Soylent Corp", "Initech", "Umbrella Corporation",
  "Stark Industries", "Wayne Enterprises", "Cyberdyne Systems", "Massive Dynamic",
  "Waystar Royco", "Hooli", "Pied Piper", "Dunder Mifflin", "Oceanic Airlines",
  "Gekko & Co", "Stanfield LLC", "Los Pollos Hermanos", "Iron Mountain", "Weyland-Yutani",
  "Sterling Cooper", "Bluth Company", "Prestige Worldwide", "Vehement Capital Partners",
  "Goliath National Bank", "Oscorp Industries", "Beneke Fabricators", "Genco Pura Oil",
  "Abstergo Industries", "Axiom Telecommunication", "Gringotts Bank", "Monsters Inc.",
  "Wonka Industries", "Nakatomi Trading Corp", "Tyrell Corporation", "Creed & Sons"
];

const emailDomains = ["gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "company.com", "business.net", "corp.org"];

const streetNames = [
  "Main St", "Oak Ave", "Maple Dr", "Cedar Ln", "Pine St", "Elm St", "Washington Ave",
  "Park Ave", "Broadway", "Lake St", "River Rd", "Mountain View", "Sunset Blvd",
  "Industry Park", "Tech Plaza", "Commerce Way", "Market St", "Business Pkwy"
];

const cities = [
  "New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio",
  "San Diego", "Dallas", "San Jose", "Austin", "Jacksonville", "San Francisco", "Boston",
  "Denver", "Seattle", "Portland", "Atlanta", "Miami", "Detroit", "Minneapolis"
];

const states = [
  "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN",
  "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV",
  "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN",
  "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"
];

const products = [
  { name: "Web Development", description: "Full stack web application development", price: 120.00 },
  { name: "UI/UX Design", description: "User interface and experience design", price: 95.00 },
  { name: "Server Maintenance", description: "Monthly server maintenance and updates", price: 75.00 },
  { name: "Mobile App Development", description: "Native mobile application development", price: 145.00 },
  { name: "SEO Optimization", description: "Search engine optimization services", price: 85.00 },
  { name: "Content Creation", description: "Blog posts and content marketing", price: 65.00 },
  { name: "Database Design", description: "Database architecture and optimization", price: 110.00 },
  { name: "Cloud Migration", description: "Migrate systems to cloud infrastructure", price: 130.00 },
  { name: "Security Audit", description: "Comprehensive security assessment", price: 150.00 },
  { name: "Social Media Management", description: "Monthly social media account management", price: 70.00 },
  { name: "Logo Design", description: "Professional logo design services", price: 80.00 },
  { name: "Email Marketing", description: "Email campaign setup and management", price: 60.00 },
  { name: "Data Analysis", description: "Data analytics and reporting", price: 90.00 },
  { name: "API Integration", description: "Third-party API integration services", price: 105.00 },
  { name: "Project Management", description: "Professional project management services", price: 95.00 },
  { name: "QA Testing", description: "Software quality assurance testing", price: 80.00 },
  { name: "Tech Consultation", description: "Technology consultation services (hourly)", price: 125.00 },
  { name: "Website Hosting (Monthly)", description: "Managed website hosting services", price: 45.00 },
  { name: "Domain Registration (Yearly)", description: "Domain name registration and renewal", price: 15.00 },
  { name: "Video Production", description: "Professional video production services", price: 175.00 }
];

// --- Generators ---
const generateClients = (count = 30) => {
  const clients = [];

  for (let i = 0; i < count; i++) {
    const companyName = companyNames[i % companyNames.length];
    const emailDomain = randomChoice(emailDomains);
    const email = `billing@${companyName.toLowerCase().replace(/\s+/g, '')}.${emailDomain}`;
    const phone = generatePhone();
    const streetNumber = randomInt(100, 9999);
    const street = randomChoice(streetNames);
    const city = randomChoice(cities);
    const state = randomChoice(states);
    const zipCode = randomInt(10000, 99999);
    const address = `${streetNumber} ${street}, ${city}, ${state} ${zipCode}`;
    const createdAt = randomDate(new Date(2022, 0, 1), new Date(2023, 7, 1)).toISOString();

    clients.push({
      name: companyName,
      email,
      phone,
      address,
      created_at: createdAt
    });
  }

  return clients;
};

const generateProducts = (count = 20) => {
  return products.slice(0, count).map((product) => ({
    name: product.name,
    description: product.description,
    price: product.price,
    created_at: randomDate(new Date(2022, 0, 1), new Date(2023, 5, 1)).toISOString()
  }));
};

// --- Output SQL ---
const writeSQL = () => {
  const clients = generateClients(30);
  const products = generateProducts(20);
  const lines = [];

  lines.push('BEGIN TRANSACTION;');

  clients.forEach(c => {
    lines.push(`INSERT INTO clients (name, email, phone, address, created_at) VALUES (` +
      `'${escapeString(c.name)}', ` +
      `'${escapeString(c.email)}', ` +
      `'${escapeString(c.phone)}', ` +
      `'${escapeString(c.address)}', ` +
      `'${c.created_at}');`);
  });

  products.forEach(p => {
    lines.push(`INSERT INTO products (name, description, price, created_at) VALUES (` +
      `'${escapeString(p.name)}', ` +
      `'${escapeString(p.description)}', ` +
      `${p.price.toFixed(2)}, ` +
      `'${p.created_at}');`);
  });

  lines.push('COMMIT;');

  const outputPath = path.join(__dirname, 'seed.sql');
  fs.writeFileSync(outputPath, lines.join('\n'), 'utf8');
  console.log(`✅ Wrote ${clients.length} clients and ${products.length} products to ${outputPath}`);
};

writeSQL();
