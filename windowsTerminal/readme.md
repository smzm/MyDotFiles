## Windows Terminal settings

<br>

### 1. Install `JetBrainsMonoNL Nerd Font`:
Download latest jetbrains font from [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip)


### 2. Config `settings.json`
In **windows terminal** and go to the settings and select `Open JSON file`.

#### Add color scheme : 
```json
"schemes": [

        {
            "background": "#000000",
            "black": "#000000",
            "blue": "#0037DA",
            "brightBlack": "#767676",
            "brightBlue": "#3B78FF",
            "brightCyan": "#61D6D6",
            "brightGreen": "#16C60C",
            "brightPurple": "#B4009E",
            "brightRed": "#E74856",
            "brightWhite": "#F2F2F2",
            "brightYellow": "#F9F1A5",
            "cursorColor": "#FFFFFF",
            "cyan": "#3A96DD",
            "foreground": "#CCCCCC",
            "green": "#13A10E",
            "name": "Campbell",
            "purple": "#881798",
            "red": "#C50F1F",
            "selectionBackground": "#FFFFFF",
            "white": "#CCCCCC",
            "yellow": "#C19C00"
        },

]
```
<br>

#### Add keymap : 
```json
"actions": [

        {
            "command": "find",
            "keys": "ctrl+shift+f"
        },
        {
            "command": 
            {
                "action": "copy",
                "singleLine": false
            },
            "keys": "ctrl+c"
        },
        {
            "command": 
            {
                "action": "splitPane",
                "split": "right"
            },
            "keys": "ctrl+shift+\\"
        },
        {
            "command": "paste"
        },
        {
            "command": 
            {
                "action": "splitPane",
                "split": "auto",
                "splitMode": "duplicate"
            },
            "keys": "alt+shift+d"
        },
        {
            "command": 
            {
                "action": "resizePane",
                "direction": "up"
            },
            "keys": "ctrl+shift+up"
        },
        {
            "command": "closePane",
            "keys": "ctrl+shift+x"
        },
        {
            "command": 
            {
                "action": "resizePane",
                "direction": "right"
            },
            "keys": "ctrl+shift+right"
        },
        {
            "command": "unbound",
            "keys": "ctrl+v"
        },
        {
            "command": "unbound",
            "keys": "ctrl+shift+w"
        },
        {
            "command": "unbound",
            "keys": "alt+shift+down"
        },
        {
            "command": "unbound",
            "keys": "alt+shift+left"
        },
        {
            "command": "unbound",
            "keys": "alt+shift+right"
        },
        {
            "command": "unbound",
            "keys": "alt+shift+up"
        },
        {
            "command": "unbound",
            "keys": "alt+shift+minus"
        },
        {
            "command": "unbound",
            "keys": "alt+shift+plus"
        },
        {
            "command": 
            {
                "action": "splitPane",
                "split": "down"
            },
            "keys": "ctrl+shift+minus"
        },
        {
            "command": 
            {
                "action": "scrollDown"
            },
            "keys": "ctrl+down"
        },
        {
            "command": 
            {
                "action": "scrollUp"
            },
            "keys": "ctrl+up"
        },
        {
            "command": 
            {
                "action": "resizePane",
                "direction": "down"
            },
            "keys": "ctrl+shift+down"
        },
        {
            "command": 
            {
                "action": "resizePane",
                "direction": "left"
            },
            "keys": "ctrl+shift+left"
        }
        
    ]
```

<br>

#### Add custom config : 
```json
    "copyOnSelect": true,
```
```json
"profiles": 
    {
        "defaults": {
        
            "historySize": 12000,
            "intenseTextStyle": "bright",
            "padding": "8"
        
        },

}        
```
