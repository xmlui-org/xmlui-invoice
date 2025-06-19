# XMLUI Invoice

A sample invoice app, built with [XMLUI](https://TBD), to demonstrate the framework's capabilities.

## Features

**Invoice Management**
- Create, edit, and track invoices
- Nested form for line items
- Detailed invoice views

**Client Management**
- Create and edit clients
- Track outstanding balances

**Product Catalog**
- Create and edit products
- Import products from CSV

**Data visualization**
- Interactive dashboard with key metrics
- Revenue tracking and visualization
- Monthly and daily revenue charts

**Search**
- Date-based invoice filtering
- Search across clients, products, invoices

## Quick start

### Prerequisites
- Batteries included! No additional software required.

### Run the app

**On macOS/Linux:**
```bash
./start.sh
```

**On Windows:**
```bash
start.bat
```

Then open your browser to `http://localhost:8080`

### Things to try
1. Explore the dashboard to see your business overview
2. Browse existing clients and invoices
3. Create a new invoice using the "Create Invoice" button
4. Import products via the Import page using the provided CSV format

## Project structure

```
xmlui-invoice/
├── Main.xmlui              # Application entry point
├── api.json                # REST API definition
├── config.json             # Application configuration
├── data.db                 # SQLite database
├── components/             # XMLUI components
│   ├── Dashboard.xmlui
│   ├── Invoices.xmlui
│   ├── Clients.xmlui
│   └── ...
├── themes/                 # Custom theme
├── sql  /                  # Queries
├── resources/              # Static assets
```

## Customization

### Add features
1. **New components**: Add them to `/components` and register routes in `Main.xmlui`
2. **API endpoints**: Extend `api.json` with new SQL-based endpoints
3. **Database changes**: Modify `data.db` (SQLite) schema as needed
4. **Styling**: Customize the theme in `/themes/invoice.json`

### Alter data
The application includes sample clients, invoices, and products. You can:
- Clear existing data and start fresh
- Import your own data using the CSV import feature
- Add tables to support new features

## What this demo shows

**Capabilities:**
- **Rapid development**: Complete business app with minimal and readable code
- **Reactive data binding**: Dynamic data binding and updates
- **Professional theming**: Looks great out of the box, easy to customize
- **Database integration**: SQLite integration via API
- **Component reuse**: Modular, composable UI elements

**Patterns:**
- Form handling and validation
- Data visualization and charts
- File import and processing
- Search and filtering
- Master-detail relationships


## Learning objectives

Use this application to explore:
- API design patterns
- Component creation and reuse
- Theme customization
- User experience patterns

## XMLUI Documentation

- [Introduction](https://docs.xmlui.com/)
- [Tutorial](https://docs.xmlui.com/#/tutorial-01)
- [Components](https://docs.xmlui.com/#/components/_overview)
- [Guides](https://docs.xmlui.com/#/app-structure)

## License

This project uses the MIT License. See the [main XMLUI repository](https://github.com/xmlui-com/xmlui) for details.

