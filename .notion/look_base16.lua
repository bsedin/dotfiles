-- look_simpleblue.lua drawing engine configuration file for Notion.

if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
    shadow_colour = "black",
    highlight_colour = "black",
    background_colour = "#1d2021",
    foreground_colour = "#d5c4a1",
    padding_pixels = 0,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "elevated",
    font = "-*-Fixedsys Excelsior-regular-r-*-*-13-*-*-*-*-*-*",
    text_align = "center",
})

de.defstyle("frame", {
    shadow_colour = "black",
    highlight_colour = "#1d2021",
    padding_colour = "#1d2021",
    background_colour = "black",
    foreground_colour = "#1d2021",
    padding_pixels = 0,
    highlight_pixels = 0,
    shadow_pixels = 0,
    de.substyle("active", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = "#665c54",
        foreground_colour = "#1d2021",
    }),
})

de.defstyle("tab", {
    de.substyle("active-selected", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = "#665c54",
        foreground_colour = "#fbf1c7",
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
    background_colour = "#1d2021",
    foreground_colour = "#fbf1c7",
    padding_pixels = 1,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "elevated",
    de.substyle("*-cursor", {
        background_colour = "#fdf6e3",
        foreground_colour = "#1d2021",
    }),
    de.substyle("*-selection", {
        background_colour = "#83a598",
        foreground_colour = "#1d2021",
    }),
})

de.defstyle("input-menu", {
    padding_pixels=0,
})

de.defstyle("stdisp", {
    shadow_pixels = 0,
    highlight_pixels = 0,
    text_align = "left",
    background_colour = "black",
    foreground_colour = "#bdae93",
    -- font = "-*-Fixedsys Excelsior-regular-r-*-*-13-*-*-*-*-*-*",
    font = "-*-Iosevka Term Bold-regular-r-*-*-13-*-*-*-*-*-*",

    de.substyle("important", {
        background_colour = "black",
        foreground_colour = "#b8bb26",
        highlight_colour = "#1d2021",
    }),

    de.substyle("critical", {
        background_colour = "black",
        foreground_colour = "#fb4934",
        highlight_colour = "#1d2021",
    }),
})

-- dopath("lookcommon_clean")

gr.refresh()
