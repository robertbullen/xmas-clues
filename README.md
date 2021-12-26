# xmas-clues

This simple web project was created as part of a Christmas present for my family in 2021. QR codes were hidden around the house, each encoding a URL that presents a riddle. Riddles described objects where the next QR code could be found. The chain of QR codes and riddles eventually led family members to their gifts.

## Project Structure

### Web Content

The `public` directory holds all web content that is uploaded to a web server:

- a single `public/index.html` page, and
- a `public/clues` directory, which holds all riddles as markdown files.

Note: Markdown files use `.txt` as their extensions so that the hosting IIS server will serve them up; it returned 404 status codes when the standard `.md` extension was used.

### Shell Scripts

There are also a couple shell scripts in the project root that generate some graphics:

- `generate-example-gif.sh` - Generates the example animated GIF below.
- `generate-qr-codes.sh` - Generates a sheet of QR codes as a PNG image, which can be printed and cut into physical QR codes for placement in the real world.

Each script installs its dependencies using [Homebrew](https://brew.sh/) (because this project was developed on macOS) as one of the first steps.

## How It Works

When the `public/index.html` webpage is requested, the `?clueName=<clueName>` query parameter must be provided, where `<clueName>` is the name of the markdown file without extension. The browser then requests the corresponding markdown file from the server, renders it into the DOM, and adds some simple animation (unless the `&skipAnimation` query parameter is provided, which is handy for quickly viewing changes during development).

For example, navigating to <https://robertbullen.com/xmas-clues/?clueName=kerry1> results in something like this, as it would be rendered on a 9:16 mobile device:

![Example Animated Riddle](doc/example.gif)

## Development

To start local development, run the following commands:

```bash
# Install dependencies.
yarn

# Start a development web server and open the browser to the default clue.
yarn start
```

## Deployment

Deployment consists of the following steps:

1. Assign the `BASE_URL` variable in `generate-qr-codes.sh` to the address of the website that will serve this project.
2. Run `yarn build` to generate the QR codes sheet.
3. Copy the `public/` directory to the web server specified in step #1.
