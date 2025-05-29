return {
	cmd = { "jails", "-jai_path", "$(which jai)" },
	filetypes = { "jai" },
	root_markers = { "jails.json", ".git", "build.jai" },
}
