-- strip-emoji.lua
-- Removes emoji-like Unicode characters only when rendering to LaTeX/PDF.

if not FORMAT:match("latex") then
  return {}
end

local function is_emoji_or_emoji_part(cp)
  return
    cp == 0x200D or                    -- zero-width joiner
    cp == 0x20E3 or                    -- keycap combining mark
    (cp >= 0xFE00 and cp <= 0xFE0F) or -- variation selectors
    (cp >= 0xE0100 and cp <= 0xE01EF) or
    (cp >= 0x1F000 and cp <= 0x1FAFF) or
    (cp >= 0x2600 and cp <= 0x27BF) or
    (cp >= 0x2300 and cp <= 0x23FF) or
    (cp >= 0x2B00 and cp <= 0x2BFF)
end

local function strip_emoji(text)
  local clean = {}

  for _, cp in utf8.codes(text) do
    if not is_emoji_or_emoji_part(cp) then
      table.insert(clean, utf8.char(cp))
    end
  end

  return table.concat(clean)
end

function Str(el)
  el.text = strip_emoji(el.text)
  return el
end

function Code(el)
  el.text = strip_emoji(el.text)
  return el
end

function CodeBlock(el)
  el.text = strip_emoji(el.text)
  return el
end