local ls = require("luasnip")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
})

require("luasnip.loaders.from_vscode").lazy_load()

local snippet = ls.s
local t = ls.text_node

local snippets = {}

snippets.all = {
	snippet("testsnippet", t("This is a test snippet!")),
}

ls.snippets = snippets

-- mappings
local map = require("keymap").map
local imap = require("keymap").imap

map({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end)

map({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

imap("<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

imap("<c-u>", require("luasnip.extras.select_choice"))
