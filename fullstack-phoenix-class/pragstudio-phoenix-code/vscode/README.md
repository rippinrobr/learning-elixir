# VSCode Goodies

## snippets

In the `snippets` directory you'll find two snippet files: `elixir.json` and `phoenix-heex.json`.

To install these custom VS Code snippets, use the "Snippets: Configure Snippets" command or select "Configure User Snippets" under "Code > Settings" (on Windows, select "User Snippets" under "File > Preferences"). Then select "elixir.json".

Paste the contents of `snippets/elixir.json` into that file. If you already have snippets in that file, you'll need to put all the snippets in one top-level JavaScript object.

Then run the "Snippets: Configure Snippets" command again and select "phoenix-heex.json". Paste the contents of `snippets/phoenix-heex.json` into that file.

## settings.json

To add these settings, open your user settings in VS Code using the "Preferences: Open Settings (JSON)" command and paste the contents of `settings.json` into that file.

All the settings need to be in a top-level JavaScript object, so remove the outer curly braces in `settings.json`.

## keybindings.json

To add these keybindings, open your keybinds in VS Code using the "Preferences: Open Keyboard Shortcuts (JSON)" command and paste the contents of `keybindings.json` into that file.

If you already have keybindings in that file, you'll need to put all the bindings in one top-level JavaScript object, so remove the outer curly braces in `keybindings.json`.

## Extensions

- [Material Theme](https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme) extension for the color theme

- [ElixirLS](https://marketplace.visualstudio.com/items?itemName=JakeBecker.elixir-ls) extension for Elixir support

- [Phoenix Framework](https://marketplace.visualstudio.com/items?itemName=phoenixframework.phoenix) extension for syntax highlighting of HEEx templates

- [Elixir Snippets](https://marketplace.visualstudio.com/items?itemName=florinpatrascu.vscode-elixir-snippets) extension for Elixir code snippets.

- [Simple Ruby ERB](https://marketplace.visualstudio.com/items?itemName=vortizhe.simple-ruby-erb) extension for toggling `<%= %>` EEx tags
