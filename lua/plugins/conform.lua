return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      cmake = { "cmake-format" },
      -- Add other filetypes as needed
    },
    formatters = {
      clang_format = {
        -- Optional: Customize clang-format arguments here
        -- For example, to use a specific style:
        -- args = { "--style=llvm" },
      },
    },
  },
}
