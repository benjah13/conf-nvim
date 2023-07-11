require("lsp-lens").setup {
  enable = true,
  include_declaration = false, -- Reference include declaration
  sections = { -- Enable / Disable specific request
    definition = false,
    references = true,
    implementation = false,
  },
  ignore_filetype = {
    -- "prisma",
  },
}
