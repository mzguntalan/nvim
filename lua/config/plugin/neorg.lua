require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    not_research = "~/Github/neorg/not_research",
                    research = "~/Github/neorg/research",
                    default = "~/Github/neorg/default",

                }
            }
        }
    }
})
