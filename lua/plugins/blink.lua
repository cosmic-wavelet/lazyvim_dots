return {
    {
        "saghen/blink.cmp",
        enabled = true,
        opts = {
            keymap = {
                ["<C-t>"] = {
                    function(cmp)
                        -- 1. If completion menu isn’t up, do nothing
                        if not cmp.is_visible() then
                            return
                        end

                        -- 2. Identify the current keyword under cursor:
                        local keyword = require("blink.cmp.completion.list").context.get_keyword()

                        -- 3. Loop through the items in the completion menu
                        local accept_index = nil
                        for index, item in ipairs(cmp.get_items()) do
                            -- We only care about items coming from Blink’s “snippets” source
                            if item.source_id == "snippets" and item.label == keyword then
                                accept_index = index
                                break
                            end
                        end

                        -- 4. If we found a matching snippet, accept it by index
                        if accept_index then
                            cmp.accept({ index = accept_index })
                        end
                    end,
                    "snippet_forward",
                    "fallback",
                },
                -- If you had <S-Tab> similarly, you could do:
                ["<C-j>"] = { "select_next" },
                ["<C-k>"] = { "select_prev" },
                ["<C-f>"] = { "scroll_documentation_up" },
                ["<C-d>"] = { "scroll_documentation_down" },
                -- Confirm with Enter:
                ["<CR>"] = { "accept", "fallback" },
            },
        },
    },
    {
        "windwp/nvim-autopairs",
        enabled = false,
        event = "InsertEnter",
        config = true,
        opts = {},
    },
    -- {
    --   "hrsh7th/nvim-cmp",
    --   enabled = false,
    --   opts = function(_, opts)
    --     opts.snippet = {
    --       expand = function(args)
    --         require("luasnip").lsp_expand(args.body)
    --       end,
    --     }
    --     table.insert(opts.sources, { name = "luasnip" })
    --     local has_words_before = function()
    --       unpack = unpack or table.unpack
    --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    --     end
    --
    --     local luasnip = require("luasnip")
    --     local cmp = require("cmp")
    --     local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
    --       ["<C-t>"] = cmp.mapping(function(fallback)
    --         -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
    --         -- this way you will only jump inside the snippet region
    --         if luasnip.expand_or_jumpable() then
    --           luasnip.expand_or_jump()
    --         elseif cmp.visible() then
    --           cmp.select_next_item()
    --         elseif has_words_before() then
    --           cmp.complete()
    --         else
    --           fallback()
    --         end
    --       end, { "i", "s" }),
    --       ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if luasnip.jumpable(-1) then
    --           luasnip.jump(-1)
    --         elseif cmp.visible() then
    --           cmp.select_prev_item()
    --         else
    --           fallback()
    --         end
    --       end, { "i", "s" }),
    --       ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    --       ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    --       ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    --       ["<C-d>"] = cmp.mapping.scroll_docs(4),
    --     })
    --   end,
    -- },
}
