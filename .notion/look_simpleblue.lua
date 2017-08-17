-- look_simpleblue.lua drawing engine configuration file for Notion.

if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
    shadow_colour = "black",
    highlight_colour = "black",
    background_colour = "#073642",
    foreground_colour = "#9f9f9f",
    padding_pixels = 0,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "elevated",
    font = "-*-Fixedsys Excelsior-regular-r-*-*-13-*-*-*-*-*-*",
    text_align = "center",
})

de.defstyle("frame", {
    shadow_colour = "black",
    highlight_colour = "black",
    padding_colour = "black",
    background_colour = "black",
    foreground_colour = "#ffffff",
    padding_pixels = 0,
    highlight_pixels = 0,
    shadow_pixels = 0,
    de.substyle("active", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = "#657b83",
        foreground_colour = "#ffffff",
    }),
})

de.defstyle("tab", {
    de.substyle("active-selected", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = "#657b83",
        foreground_colour = "#fdf6e3",
    }),
    --de.substyle("active-unselected", {
        --shadow_colour = "black",
        --highlight_colour = "black",
        --background_colour = "#073642",
        --foreground_colour = "#9f9f9f",
    --}),
    --de.substyle("inactive-selected", {
        --shadow_colour = "black",
        --highlight_colour = "black",
        --background_colour = "#382C1B",
        --foreground_colour = "#bfbfbf",
    --}),
    --de.substyle("inactive-unselected", {
        --shadow_colour = "black",
        --highlight_colour = "black",
        --background_colour = "#073642",
        --foreground_colour = "#9f9f9f",
    --}),
    padding_pixels = 1,
    text_align = "left",
})

de.defstyle("input", {
    shadow_colour = "black",
    highlight_colour = "black",
    background_colour = "#657b83",
    foreground_colour = "#fdf6e3",
    padding_pixels = 1,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "elevated",
    de.substyle("*-cursor", {
        background_colour = "white",
        foreground_colour = "#3f3f3f",
    }),
    de.substyle("*-selection", {
        background_colour = "black",
        foreground_colour = "white",
    }),
})

de.defstyle("input-menu", {
    padding_pixels=0,
})

dopath("lookcommon_clean")

de.defstyle("stdisp", {
    shadow_pixels = 0,
    highlight_pixels = 0,
    text_align = "left",
    background_colour = "black",
    foreground_colour = "#93a1a1",
    font = "-*-Fixedsys Excelsior-regular-r-*-*-13-*-*-*-*-*-*",

    de.substyle("important", {
        foreground_colour = "green",
    }),

    de.substyle("critical", {
        foreground_colour = "red",
    }),
})

gr.refresh()

