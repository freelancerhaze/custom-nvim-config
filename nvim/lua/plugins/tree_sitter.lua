return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- Add these dependencies if your plugin manager supports it
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = {
      'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'markdown',
      'markdown_inline', 'query', 'vim', 'vimdoc', 'python', 'javascript',
      'java', 'rust', 'go', 'css', 'kotlin'
    },
    auto_install = true,
    sync_install = false, -- Install parsers asynchronously
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
      queries = { "errors" }, -- Highlight syntax errors
    },
    indent = { enable = true, disable = { 'ruby' } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = '<C-s>',
        node_decremental = '<bs>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- Function
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          -- Class
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          -- Block
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          -- Parameter/Argument
          ['ap'] = '@parameter.outer',
          ['ip'] = '@parameter.inner',
          -- Conditional (if/else/etc.)
          ['ad'] = '@conditional.outer',
          ['id'] = '@conditional.inner',
          -- Loop
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          -- Call
          ['a,'] = '@call.outer',
          ['i,'] = '@call.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
          [']p'] = '@parameter.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
          [']P'] = '@parameter.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
          ['[p'] = '@parameter.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
          ['[P'] = '@parameter.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
    folds = {
      enable = true,
    },
    context_commentstring = { enable = true }, -- Improves commenting based on context
  },
}
