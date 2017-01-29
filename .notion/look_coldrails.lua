--
-- look_greenlight for Notion's default drawing engine.
--

if not gr.select_engine("de") then
    return
end

-- Clear existing styles from memory.
de.reset()

font_medium = "-misc-fixed-medium-r-*-*-13-*-*-*-*-60-*-*"
-- "-*-terminus-*-medium-*-*-*-11-*-*-*-*-koi8-ru"
font_bold = font_medium

-- Base style
de.defstyle("*", {
    highlight_colour = "#666666",
    shadow_colour = "#666666",
    background_colour = "#333333",
    foreground_colour = "#cccccc",

    shadow_pixels = 1,
    highlight_pixels = 1,
    padding_pixels = 1,
    spacing = 0,
    border_style = "elevated",
    border_sides = "tb",

    font = font_medium,
    text_align = "center",
})


de.defstyle("frame", {
    background_colour = "#1C1F22",
    transparent_background = false,
})


de.defstyle("tab", {
    font = font_medium,
    spacing = 0,

    de.substyle("active-selected", {
        highlight_colour = "#8ac267",
        shadow_colour = "#8ac267",
        background_colour = "#354743",
    }),

    de.substyle("inactive-selected", {
        highlight_colour = "#6aa247",
        shadow_colour = "#6aa247",
    }),
})


de.defstyle("input", {
    text_align = "left",
    spacing = 0,

    de.substyle("*-selection", {
        background_colour = "#354743",
    }),

    de.substyle("*-cursor", {
        background_colour = "#8ac267",
        foreground_colour = "#333333",
    }),
})


dopath("lookcommon_emboss")


-- Refresh objects' brushes.
gr.refresh()
