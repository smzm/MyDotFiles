return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
        disable_filetype = { 'TelescopePrompt', 'text' }
    },
    config = function(_, opts)
        local npairs = require('nvim-autopairs')
        npairs.setup(opts)
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done({}))
    end,
}
