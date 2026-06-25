local palette = require("gogh.palette")

local M = {}

function M.setup()
  local groups = {
    -- ==============================
    -- 1. Interfaz de Neovim
    -- ==============================
    Normal       = { fg = palette.fg, bg = palette.bg },
    NormalFloat  = { fg = palette.fg, bg = palette.bg_alt },
    ColorColumn  = { bg = palette.bg_alt },
    CursorLine   = { bg = palette.bg_alt },
    CursorColumn = { bg = palette.bg_alt },
    LineNr       = { fg = palette.comment },
    CursorLineNr = { fg = palette.yellow, bold = true },
    Visual       = { bg = palette.selection },
    Search       = { fg = palette.bg, bg = palette.yellow },
    IncSearch    = { fg = palette.bg, bg = palette.orange },
    VertSplit    = { fg = palette.border },
    WinSeparator = { fg = palette.border },
    Pmenu        = { fg = palette.fg, bg = palette.bg_alt },
    PmenuSel     = { bg = palette.selection },
    Comment      = { fg = palette.comment, italic = true },
    MatchParen   = { fg = palette.yellow, bold = true, bg = palette.selection },

    -- ==============================
    -- 2. Sintaxis Tradicional (Fallback)
    -- ==============================
    Constant   = { fg = palette.orange },
    String     = { fg = palette.green },
    Number     = { fg = palette.orange },
    Boolean    = { fg = palette.orange },
    Identifier = { fg = palette.fg },
    Function   = { fg = palette.blue },
    Statement  = { fg = palette.magenta },
    Operator   = { fg = palette.cyan },
    Keyword    = { fg = palette.magenta },
    PreProc    = { fg = palette.blue },
    Type       = { fg = palette.yellow },
    Special    = { fg = palette.cyan },
    Error      = { fg = palette.red },
    Todo       = { fg = palette.bg, bg = palette.yellow, bold = true },

    -- ==============================
    -- 3. Treesitter (Sintaxis Moderna)
    -- ==============================
    ["@variable"]          = { fg = palette.fg },
    ["@variable.builtin"]  = { fg = palette.red },
    ["@function"]          = { fg = palette.blue },
    ["@function.builtin"]  = { fg = palette.cyan },
    ["@function.macro"]    = { fg = palette.cyan },
    ["@keyword"]           = { fg = palette.magenta },
    ["@keyword.operator"]  = { fg = palette.magenta },
    ["@string"]            = { fg = palette.green },
    ["@string.escape"]     = { fg = palette.cyan },
    ["@number"]            = { fg = palette.orange },
    ["@boolean"]           = { fg = palette.orange },
    ["@type"]              = { fg = palette.yellow },
    ["@type.builtin"]      = { fg = palette.yellow },
    ["@parameter"]         = { fg = palette.orange, italic = true },
    ["@property"]          = { fg = palette.cyan },
    ["@operator"]          = { fg = palette.cyan },
    ["@punctuation.delimiter"] = { fg = palette.fg_alt },
    ["@punctuation.bracket"]   = { fg = palette.fg_alt },
    ["@constructor"]       = { fg = palette.yellow },

    -- ==============================
    -- 4. LSP (Diagnósticos)
    -- ==============================
    DiagnosticError = { fg = palette.red },
    DiagnosticWarn  = { fg = palette.yellow },
    DiagnosticInfo  = { fg = palette.blue },
    DiagnosticHint  = { fg = palette.cyan },
    -- Subrayados para los errores en el código
    DiagnosticUnderlineError = { undercurl = true, sp = palette.red },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = palette.yellow },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = palette.blue },
    DiagnosticUnderlineHint  = { undercurl = true, sp = palette.cyan },

    -- ==============================
    -- 5. Plugins Comunes
    -- ==============================
    -- Telescope
    TelescopeBorder = { fg = palette.border },
    TelescopePromptBorder = { fg = palette.border },
    TelescopeMatching = { fg = palette.yellow, bold = true },
    TelescopeSelection = { bg = palette.selection, fg = palette.fg },
    -- GitSigns
    GitSignsAdd    = { fg = palette.green },
    GitSignsChange = { fg = palette.yellow },
    GitSignsDelete = { fg = palette.red },
    -- NvimTree
    NvimTreeFolderIcon = { fg = palette.blue },
    NvimTreeIndentMarker = { fg = palette.border },
  }

  -- Bucle mágico que inyecta todos los colores en Neovim
  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
