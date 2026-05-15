require("keybinds")
require("windowrules")

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@239.96Hz",
    position = "auto",
    scale    = "auto",
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("pidof waybar; if [ $? -eq 1 ]; then waybar; fi")
  hl.exec_cmd("sleep 10 && obs --startreplaybuffer", { workspace = "10 silent" })
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_THEME", "NotwaitaBlack")

-- NVIDIA wayland
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.env("GTK_THEME", "Adwaita:dark")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "Adwaita-Dark")
hl.env("QT_STYLE_OVERRIDE", "Adwaita-Dark")

hl.env("SDL_AUDIODRIVER", "pipewire")
hl.env("SDL_VIDEODRIVER", "wayland")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 0,

        border_size = 2,

        col = {
            active_border   = "rgba(00ff00ff)",
            inactive_border = "rgba(595959ff)",
        },

        resize_on_border = false,
        allow_tearing    = true,

        layout = "scrolling",
    },
    decoration = {
        rounding = 0,
        rounding_power = 0,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = { enabled = false, },
        blur   = { enabled = false, },
    },
    animations = {
        enabled = false,
    },
})

hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        explicit_column_widths = "0.5, 1.0",
        focus_fit_method = 1,
        wrap_swapcol = false,
        wrap_focus = false,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout     = "us",
        repeat_rate   = 80,
        repeat_delay  = 200,

        float_switch_override_focus = 0,
        mouse_refocus = false,

        sensitivity   = 0,
        accel_profile = "flat",
        follow_mouse  = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.config({
    cursor = {
        no_warps = true,
    },
})

hl.gesture({
    direction = "horizontal",
    fingers   = 3,
    action    = "workspace",
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo = true,
        disable_autoreload = true,
        background_color = 0x000000,
        vrr = 0,
    },
})
