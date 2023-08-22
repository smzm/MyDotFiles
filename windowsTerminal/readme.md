## Windows Terminal settings

<br>

### 1. Install `JetBrainsMonoNL Nerd Font`:
Download latest jetbrains font from [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip)


### 2. Config `settings.json`
In **windows terminal** go to the settings and select `Open JSON file`.

#### Add color scheme : 
```json
"schemes": [

      {
            "background": "#1A1A1A",
            "black": "#121212",
            "blue": "#2B4FFF",
            "brightBlack": "#666666",
            "brightBlue": "#5C78FF",
            "brightCyan": "#5AC8FF",
            "brightGreen": "#905AFF",
            "brightPurple": "#5EA2FF",
            "brightRed": "#BA5AFF",
            "brightWhite": "#FFFFFF",
            "brightYellow": "#685AFF",
            "cursorColor": "#FFFFFF",
            "cyan": "#28B9FF",
            "foreground": "#F1F1F1",
            "green": "#d335ff",
            "name": "xcad",
            "purple": "#2883FF",
            "red": "#A52AFF",
            "selectionBackground": "#FFFFFF",
            "white": "#F1F1F1",
            "yellow": "#3D2AFF"
        }

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
        
                "colorScheme": "xcad",
                 "font": {
                        "face": "JetBrainsMono Nerd Font",
                        "weight": "light"
                 },
                 "historySize": 12000,
                 "intenseTextStyle": "bright",
                 "opacity": 95,
                 "padding": "8",
                 "useAcrylic": true
        
        },

}        
```
