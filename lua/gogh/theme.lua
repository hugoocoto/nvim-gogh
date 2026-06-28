local palette = require("gogh.palette")

local M = {}

function M.setup()
    local groups = {
        ColorColumn                      = { bg = palette.bg_alt },                      -- Used for the columns set with 'colorcolumn'.
        Conceal                          = {},                                           -- Placeholder characters substituted for concealed text (see 'conceallevel').
        CurSearch                        = { link = "Search" },                          -- Current match for the last search pattern (see 'hlsearch'). Note: This is correct after a search, but may get outdated if changes are made or the screen is redrawn.
        Cursor                           = {},                                           -- Character under the cursor.
        lCursor                          = {},                                           -- Character under the cursor when |language-mapping| is used (see 'guicursor').
        CursorIM                         = {},                                           -- Like Cursor, but used when in IME mode. *CursorIM*
        CursorColumn                     = { link = "ColorColumn" },                     -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine                       = { link = "ColorColumn" },                     -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory                        = { fg = palette.blue },                        -- Directory names (and other special names in listings).
        DiffAdd                          = { fg = palette.bg_alt, bg = palette.green },  -- Diff mode: Added line. |diff.txt|
        DiffChange                       = { bg = palette.bg_alt },                      -- Diff mode: Changed line. |diff.txt|
        DiffDelete                       = { fg = palette.bg_alt, bg = palette.red },    -- Diff mode: Deleted line. |diff.txt|
        DiffText                         = { fg = palette.yellow, bg = palette.bg_alt }, -- Diff mode: Changed text within a changed line. |diff.txt|
        DiffTextAdd                      = { link = "DiffAdd" },                         -- Diff mode: Added text within a changed line.  Linked to |hl-DiffText| by default. |diff.txt|
        EndOfBuffer                      = { fg = palette.muted },                       -- Filler lines (~) after the last line in the buffer. By default, this is highlighted like |hl-NonText|.
        TermCursor                       = {},                                           -- Cursor in a focused terminal.
        OkMsg                            = { fg = palette.green },                       -- Success messages.
        WarningMsg                       = { fg = palette.yellow },                      -- Warning messages.
        ErrorMsg                         = { fg = palette.red },                         -- Error messages.
        StderrMsg                        = { link = "ErrorMsg" },                        -- Messages in stderr from shell commands.
        StdoutMsg                        = { link = "Normal" },                          -- Messages in stdout from shell commands.
        WinSeparator                     = { fg = palette.bg_alt },                      -- Separators between window splits.
        Folded                           = { fg = palette.muted, bg = palette.bg_alt },  -- Line used for closed folds.
        FoldColumn                       = { fg = palette.muted },                       -- 'foldcolumn'
        SignColumn                       = {},                                           -- Column where |signs| are displayed.
        IncSearch                        = { fg = palette.fg, bg = palette.yellow },     -- 'incsearch' highlighting; also used for the text replaced with \":s///c\".
        Substitute                       = { fg = palette.fg, bg = palette.bg_alt },     -- |:substitute| replacement text highlighting.
        LineNr                           = { fg = palette.muted },                       -- Line number for \":number\" and \":#\" commands, and when 'number' or 'relativenumber' option is set.
        LineNrAbove                      = { link = "LineNr" },                          -- Line number for when the 'relativenumber' option is set, above the cursor line.
        LineNrBelow                      = { link = "LineNr" },                          -- Line number for when the 'relativenumber' option is set, below the cursor line.
        CursorLineNr                     = { link = "LineNr" },                          -- Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is \"both\", for the cursor line.
        CursorLineFold                   = { link = "FoldColumn" },                      -- Like FoldColumn when 'cursorline' is set for the cursor line.
        CursorLineSign                   = { link = "SignColumn" },                      -- Like SignColumn when 'cursorline' is set for the cursor line.
        MatchParen                       = { fg = palette.fg, bg = palette.bg_alt },     -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg                          = { link = "Normal" },                          -- 'showmode' message (e.g., \"-- INSERT --\").
        MsgArea                          = {},                                           -- Area for messages and command-line, see also 'cmdheight'.
        MsgSeparator                     = { fg = palette.muted },                       -- Separator for scrolled messages |msgsep|.
        MoreMsg                          = { fg = palette.blue },                        -- |more-prompt|
        NonText                          = { fg = palette.cyan },                        -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal                           = { fg = palette.fg },                          -- Normal text.
        NormalFloat                      = { fg = palette.fg, bg = palette.bg_alt },     -- Normal text in floating windows.
        FloatBorder                      = { fg = palette.muted },                       -- Border of floating windows.
        FloatShadow                      = { bg = palette.bg_alt },                      -- Blended areas when border is \"shadow\".
        FloatShadowThrough               = { link = "FloatShadow" },                     -- Shadow corners when border is \"shadow\".
        FloatTitle                       = { link = "Normal" },                          -- Title of floating windows.
        FloatFooter                      = { link = "Normal" },                          -- Footer of floating windows.
        NormalNC                         = {},                                           -- Normal text in non-current windows.
        ComplMatchIns                    = { fg = palette.blue },                        -- Matched text of the currently inserted completion.
        PreInsert                        = { fg = palette.fg, bg = palette.bg_alt },     -- Text inserted when \"preinsert\" is in 'completeopt'.
        ComplHint                        = { fg = palette.muted },                       -- Virtual text of the currently selected completion.
        ComplHintMore                    = { fg = palette.muted },                       -- The additional information of the virtual text.
        Question                         = { link = "WarningMsg" },                      -- |hit-enter| prompt and yes/no questions.
        QuickFixLine                     = { fg = palette.fg, bg = palette.bg_alt },     -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search                           = { bg = palette.yellow },                      -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        SnippetTabstop                   = {},                                           -- Tabstops in snippets. |vim.snippet|
        SnippetTabstopActive             = { bg = palette.bg_alt },                      -- The currently active tabstop. |vim.snippet|
        SpecialKey                       = { fg = palette.cyan },                        -- Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad                         = { underline = true },                         -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap                         = { underline = true },                         -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal                       = { underline = true },                         -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare                        = { underline = true },                         -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine                       = { fg = palette.fg, bg = palette.bg_alt },     -- Status line of current window.
        StatusLineNC                     = { fg = palette.muted, bg = palette.bg_alt },  -- Status lines of not-current windows.
        StatusLineTerm                   = { link = "StatusLine" },                      -- Status line of |terminal| window.
        StatusLineTermNC                 = { link = "StatusLineNC" },                    -- Status line of non-current |terminal| windows.
        TabLine                          = { fg = palette.muted, bg = palette.bg_alt },  -- Tabpages line, not active tabpage label.
        TabLineFill                      = {},                                           -- Tabpages line, where there are no labels.
        TabLineSel                       = {},                                           -- Tabpages line, active tabpage label.
        Title                            = { fg = palette.blue },                        -- Titles for output from \":set all\", \":autocmd\" etc.
        Visual                           = { bg = palette.bg_alt },                      -- Visual mode selection.
        VisualNOS                        = { link = "Visual" },                          -- Visual mode selection when vim is \"Not Owning the Selection\".
        Whitespace                       = { fg = palette.cyan },                        -- \"nbsp\", \"space\", \"tab\", \"multispace\", \"lead\" and \"trail\" in 'listchars'.
        WildMenu                         = { fg = palette.fg, bg = palette.bg_alt },     -- Current match in 'wildmenu' completion.
        WinBar                           = { fg = palette.fg, bg = palette.bg_alt },     -- Window bar of current window.
        WinBarNC                         = { link = "StatusLineNC" },                    -- Window bar of not-current windows.
        Menu                             = { fg = palette.fg, bg = palette.bg_alt },     -- Current font, background and foreground colors of the menus. Also used for the toolbar. Applicable highlight arguments: font, guibg, guifg.
        Scrollbar                        = { bg = palette.bg_alt },                      -- Current background and foreground of the main window's scrollbars. Applicable highlight arguments: guibg, guifg.
        Tooltip                          = { fg = palette.fg, bg = palette.bg_alt },     -- Current font, background and foreground of the tooltips. Applicable highlight arguments: font, guibg, guifg.

        Comment                          = { fg = palette.muted },                       -- any comment
        Constant                         = { fg = palette.fg },                          -- any constant
        String                           = { fg = palette.green },                       -- a string constant: "this is a string"
        Character                        = { fg = palette.red },                         -- a character constant: 'c', '\n'
        Number                           = { fg = palette.red },                         -- a number constant: 234, 0xff
        Boolean                          = { fg = palette.red },                         -- a boolean constant: TRUE, false
        Float                            = { fg = palette.red },                         -- a floating point constant: 2.3e10
        Identifier                       = { fg = palette.fg },                          -- any variable name
        Function                         = { fg = palette.blue },                        -- function name (also: methods for classes)
        Statement                        = { fg = palette.red },                         -- any statement
        Conditional                      = { link = "Keyword" },                         -- if, then, else, endif, switch, etc.
        Repeat                           = { link = "Keyword" },                         -- for, do, while, etc.
        Label                            = { link = "Keyword" },                         -- case, default, etc.
        Operator                         = { link = "Statement" },                       -- \"sizeof\", \"+\", \"*\", etc.
        Keyword                          = { fg = palette.red },                         -- any other keyword
        Exception                        = { link = "Keyword" },                         -- try, catch, throw
        PreProc                          = {},                                           -- generic Preprocessor
        Include                          = { fg = palette.magenta },                     -- preprocessor #include
        Define                           = { fg = palette.magenta },                     -- preprocessor #define
        Macro                            = { fg = palette.magenta },                     -- same as Define
        PreCondit                        = { fg = palette.magenta },                     -- preprocessor #if, #else, #endif, etc.
        Type                             = { fg = palette.cyan },                        -- int, long, char, etc.
        StorageClass                     = { link = "Type" },                            -- static, register, volatile, etc.
        Structure                        = { link = "Type" },                            -- struct, union, enum, etc.
        Typedef                          = { link = "Type" },                            -- a typedef
        Special                          = { fg = palette.yellow },                      -- any special symbol
        SpecialChar                      = {},                                           -- special character in a constant
        Tag                              = {},                                           -- you can use CTRL-] on this
        Delimiter                        = { fg = palette.fg },                          -- character that needs attention
        SpecialComment                   = {},                                           -- special things inside a comment
        Debug                            = {},                                           -- debugging statements
        Underlined                       = { underline = true },                         -- text that stands out, HTML links
        Dimmed                           = { fg = palette.muted },                       -- text that is de-emphasized
        Ignore                           = {},                                           -- left blank, hidden  |hl-Ignore|
        Error                            = { fg = palette.red },                         -- any erroneous construct
        Todo                             = { fg = palette.cyan },                        -- anything that needs extra attention; mostly the
        keywords                         = { link = "Todo" },                            -- TODO FIXME and XXX
        Added                            = { link = "DiffAdd" },                         -- added line in a diff
        Changed                          = { link = "DiffChange" },                      -- changed line in a diff
        Removed                          = { link = "DiffDelete" },                      -- removed line in a diff

        ["@variable"]                    = { link = "Identifier" },                      -- various variable names
        ["@variable.builtin"]            = { link = "Identifier" },                      -- built-in variable names (e.g. `this`, `self`)
        ["@variable.parameter"]          = { link = "Identifier" },                      -- parameters of a function
        ["@variable.parameter.builtin"]  = { link = "Identifier" },                      -- special parameters (e.g. `_`, `it`)
        ["@variable.member"]             = { link = "Identifier" },                      -- object and struct fields
        ["@constant"]                    = { link = "Constant" },                        -- constant identifiers
        ["@constant.builtin"]            = { link = "Constant" },                        -- built-in constant values
        ["@constant.macro"]              = { link = "Macro" },                           -- constants defined by the preprocessor
        ["@module"]                      = { fg = palette.green },                       -- modules or namespaces
        ["@module.builtin"]              = { link = "@module" },                         -- built-in modules or namespaces
        ["@label"]                       = { fg = palette.cyan },                        -- `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
        ["@string"]                      = { link = "String" },                          -- string literals
        ["@string.documentation"]        = { link = "String" },                          -- string documenting code (e.g. Python docstrings)
        ["@string.regexp"]               = { link = "String" },                          -- regular expressions
        ["@string.escape"]               = { link = "String" },                          -- escape sequences
        ["@string.special"]              = { link = "String" },                          -- other special strings (e.g. dates)
        ["@string.special.symbol"]       = { link = "String" },                          -- symbols or atoms
        ["@string.special.path"]         = { link = "String" },                          -- filenames
        ["@string.special.url"]          = { link = "String" },                          -- URIs (e.g. hyperlinks)
        ["@character"]                   = { fg = palette.red },                         -- character literals
        ["@character.special"]           = { fg = palette.red },                         -- special characters (e.g. wildcards)
        ["@boolean"]                     = { fg = palette.red },                         -- boolean literals
        ["@number"]                      = { fg = palette.red },                         -- numeric literals
        ["@number.float"]                = { fg = palette.red },                         -- floating-point number literals
        ["@type"]                        = { link = "Type" },                            -- type or class definitions and annotations
        ["@type.builtin"]                = { link = "Type" },                            -- built-in types
        ["@type.definition"]             = { link = "Type" },                            -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
        ["@attribute"]                   = { fg = palette.magenta },                     -- attribute annotations (e.g. Python decorators, Rust lifetimes)
        ["@attribute.builtin"]           = { link = "@attribute" },                      -- builtin annotations (e.g. `@property` in Python)
        ["@property"]                    = { link = "Identifier" },                      -- the key in key/value pairs
        ["@function"]                    = { link = "Function" },                        -- function definitions
        ["@function.builtin"]            = { link = "Function" },                        -- built-in functions
        ["@function.call"]               = { link = "Function" },                        -- function calls
        ["@function.macro"]              = { link = "Macro" },                           -- preprocessor macros
        ["@function.method"]             = { link = "Function" },                        -- method definitions
        ["@function.method.call"]        = { link = "Function" },                        -- method calls
        ["@constructor"]                 = { fg = palette.blue },                        -- constructor calls and definitions
        ["@operator"]                    = { link = "Normal" },                          -- symbolic operators (e.g. `+`, `*`)
        ["@keyword"]                     = { fg = palette.red },                         -- keywords not fitting into specific categories
        ["@keyword.coroutine"]           = { link = "@keyword" },                        -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        ["@keyword.function"]            = { link = "@keyword" },                        -- keywords that define a function (e.g. `func` in Go, `def` in Python)
        ["@keyword.operator"]            = { link = "@keyword" },                        -- operators that are English words (e.g. `and`, `or`)
        ["@keyword.import"]              = { link = "@keyword" },                        -- keywords for including or exporting modules (e.g. `import`, `from` in Python)
        ["@keyword.type"]                = { link = "@keyword" },                        -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
        ["@keyword.modifier"]            = { link = "@keyword" },                        -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
        ["@keyword.repeat"]              = { link = "@keyword" },                        -- keywords related to loops (e.g. `for`, `while`)
        ["@keyword.return"]              = { link = "@keyword" },                        -- keywords like `return` and `yield`
        ["@keyword.debug"]               = { link = "@keyword" },                        -- keywords related to debugging
        ["@keyword.exception"]           = { link = "@keyword" },                        -- keywords related to exceptions (e.g. `throw`, `catch`)
        ["@keyword.conditional"]         = { link = "@keyword" },                        -- keywords related to conditionals (e.g. `if`, `else`)
        ["@keyword.conditional.ternary"] = { link = "@keyword" },                        -- ternary operator (e.g. `?`, `:`)
        ["@keyword.directive"]           = { link = "@keyword" },                        -- various preprocessor directives and shebangs
        ["@keyword.directive.define"]    = { link = "@keyword" },                        -- preprocessor definition directives
        ["@punctuation.delimiter"]       = { link = "Delimiter" },                       -- delimiters (e.g. `;`, `.`, `,`)
        ["@punctuation.bracket"]         = { link = "Normal" },                          -- brackets (e.g. `()`, `{}`, `[]`)
        ["@punctuation.special"]         = {},                                           -- special symbols (e.g. `{}` in string interpolation)
        ["@comment"]                     = { link = "Comment" },                         -- line and block comments
        ["@comment.documentation"]       = { link = "Comment" },                         -- comments documenting code
        ["@comment.error"]               = { link = "Error" },                           -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
        ["@comment.warning"]             = { link = "WarningMsg" },                      -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
        ["@comment.todo"]                = { link = "Todo" },                            -- todo-type comments (e.g. `TODO`, `WIP`)
        ["@comment.note"]                = { link = "Todo" },                            -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
        ["@markup.strong"]               = { bold = true },                              -- bold text
        ["@markup.italic"]               = { italic = true },                            -- italic text
        ["@markup.strikethrough"]        = { strikethrough = true },                     -- struck-through text
        ["@markup.underline"]            = { underline = true },                         -- underlined text (only for literal underline markup!)
        ["@markup.heading"]              = { fg = palette.orange },                      -- headings, titles (including markers)
        ["@markup.heading.1"]            = { link = "@markup.heading" },                 -- top-level heading
        ["@markup.heading.2"]            = { link = "@markup.heading" },                 -- section heading
        ["@markup.heading.3"]            = { link = "@markup.heading" },                 -- subsection heading
        ["@markup.heading.4"]            = { link = "@markup.heading" },                 -- and so on
        ["@markup.heading.5"]            = { link = "@markup.heading" },                 -- and so forth
        ["@markup.heading.6"]            = { link = "@markup.heading" },                 -- six levels ought to be enough for anybody
        ["@markup.quote"]                = { fg = palette.muted },                       -- block quotes
        ["@markup.math"]                 = { fg = palette.blue },                        -- math environments (e.g. `$ ... $` in LaTeX)
        ["@markup.link"]                 = { fg = palette.blue },                        -- text references, footnotes, citations, etc.
        ["@markup.link.label"]           = { link = "Normal" },                          -- link, reference descriptions
        ["@markup.link.url"]             = { link = "@markup.link" },                    -- URL-style links
        ["@markup.raw"]                  = { link = "Normal" },                          -- literal or verbatim text (e.g. inline code)
        ["@markup.raw.block"]            = { link = "Normal" },                          -- literal or verbatim text as a stand-alone block
        ["@markup.list"]                 = { fg = palette.muted },                       -- list markers
        ["@markup.list.checked"]         = { fg = palette.green },                       -- checked todo-style list markers
        ["@markup.list.unchecked"]       = { fg = palette.yellow },                      -- unchecked todo-style list markers
        ["@diff.plus"]                   = { link = "DiffAdd" },                         -- added text (for diff files)
        ["@diff.minus"]                  = { link = "DiffDelete" },                      -- deleted text (for diff files)
        ["@diff.delta"]                  = { link = "DiffChange" },                      -- changed text (for diff files)
        ["@tag"]                         = { fg = palette.blue },                        -- XML-style tag names (e.g. in XML, HTML, etc.)
        ["@tag.builtin"]                 = { link = "@tag" },                            -- builtin tag names (e.g. HTML5 tags)
        ["@tag.attribute"]               = { link = "@tag" },                            -- XML-style tag attributes
        ["@tag.delimiter"]               = { fg = palette.muted },                       -- XML-style tag delimiters

        DiagnosticError                  = { fg = palette.red },                         -- Generic error diagnostics
        DiagnosticWarn                   = { fg = palette.yellow },                      -- Generic warning diagnostics
        DiagnosticInfo                   = { fg = palette.blue },                        -- Generic info diagnostics
        DiagnosticHint                   = { fg = palette.muted },                       -- Generic hint diagnostics
        DiagnosticOk                     = { fg = palette.green },                       -- Generic OK diagnostics

        healthError                      = { fg = palette.red },                         -- Health check: error
        healthSuccess                    = { fg = palette.green },                       -- Health check: success
        healthWarning                    = { fg = palette.yellow },                      -- Health check: warning

        -- MiniPick-hl-groups

        Pmenu                            = { fg = palette.fg, bg = palette.bg_alt },    -- Popup menu: Normal item.
        PmenuBorder                      = { fg = palette.muted, bg = palette.bg_alt }, -- Popup menu: border of popup menu.
        PmenuExtra                       = { fg = palette.muted },                      -- Popup menu: Normal item \"extra text\".
        PmenuExtraSel                    = { fg = palette.muted },                      -- Popup menu: Selected item \"extra text\".
        PmenuKind                        = { link = "Pmenu" },                          -- Popup menu: Normal item \"kind\".
        PmenuKindSel                     = { link = "PmenuSel" },                       -- Popup menu: Selected item \"kind\".
        PmenuMatch                       = { fg = palette.blue },                       -- Popup menu: Matched text in normal item.  Combined with |hl-Pmenu|.
        PmenuMatchSel                    = { fg = palette.blue },                       -- Popup menu: Matched text in selected item.  Combined with |hl-PmenuMatch| and |hl-PmenuSel|.
        PmenuSbar                        = { bg = palette.bg_alt },                     -- Popup menu: Scrollbar.
        PmenuSel                         = { fg = palette.bg_alt, bg = palette.blue },  -- Popup menu: Selected item. Combined with |hl-Pmenu|.
        PmenuShadow                      = { bg = palette.bg_alt },                     -- Popup menu: blended areas when 'pumborder' is \"shadow\".
        PmenuShadowThrough               = { link = "PmenuShadow" },                    -- Popup menu: shadow corners when 'pumborder' is \"shadow\".
        PmenuThumb                       = { bg = palette.muted },                      -- Popup menu: Thumb of the scrollbar.

        MiniPickBorder                   = { link = "PmenuBorder" },                    -- window border.
        MiniPickBorderBusy               = { link = "PmenuBorder" },                    -- window border while picker is busy processing.
        MiniPickBorderText               = { link = "PmenuBorder" },                    -- non-prompt on border.
        MiniPickCursor                   = { link = "Cursor" },                         -- cursor during active picker (hidden by default).
        MiniPickHeader                   = { fg = palette.fg, bg = palette.bg_alt },    -- headers in info buffer and previews.
        MiniPickIconDirectory            = {},                                          -- default icon for directory.
        MiniPickIconFile                 = {},                                          -- default icon for file.
        MiniPickMatchCurrent             = { link = "PmenuSel" },                       -- current matched item.
        MiniPickMatchMarked              = { link = "PmenuSel" },                       -- marked matched items.
        MiniPickMatchRanges              = { link = "PmenuSel" },                       -- ranges matching query elements.
        MiniPickNormal                   = { link = "Pmenu" },                          -- basic foreground/background highlighting.
        MiniPickPreviewLine              = { link = "Visual" },                         -- target line in preview.
        MiniPickPreviewRegion            = { link = "Visual" },                         -- target region in preview.
        MiniPickPrompt                   = { link = "Normal" },                         -- prompt.
        MiniPickPromptCaret              = {},                                          -- caret in prompt.
        MiniPickPromptPrefix             = {},                                          -- prefix of the prompt.
    }

    for group, opts in pairs(groups) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M
