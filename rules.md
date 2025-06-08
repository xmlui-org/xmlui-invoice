We are working on ~/xmlui-invoice. Relevant resources you can access:

{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/jonudell/xmlui",
        "/Users/jonudell/xmlui-mcp",
        "/Users/jonudell/xmlui-test-server",
        "/Users/jonudell/xmlui-invoice",
        "/Users/jonudell/xmlui-hubspot",
        "/Users/jonudell/xmlui-mastodon"
      ]
    },
    "xmlui": {
      "command": "/Users/jonudell/xmlui-mcp/xmlui-mcp",
      "args": [
        "/Users/jonudell/xmlui-mcp",
        "/Users/jonudell",
        "xmlui-invoice,xmlui-mastodon"
      ]
    },


Rules:

1 use the filesystem to read and write repos.

2 xmlui-invoice is our project. xmlui-mastodon and others, and others are reference projects, use them to find xmlui patterns. ~/xmlui is the xmlui project, use it to scan documentation and understand component implementations. component docs are in ~/xmlui/docs/pages/components, implementations in ~/xmlui/xmlui/components. packages like charts and spreadsheets are in ~/xmlui/packages.

3 don't write any code without my permission

4 don't add any xmlui styling, let the theme and layout engine do its job

5 proceed in small increments, write the absolute minimum amount of xmlui markup necessary and no script if possible

6 do not invent any xmlui syntax. only use constructs for which you can find examples in the docs and sample apps

7 never touch the dom. we only within xmlui abstractions inside the <App> realm, with help from vars and functions defined on the window variable in index.html

8 keep complex functions and expressions out of xmlui, then can live in index.html or (if scoping requires) in code-behind

