local vim = vim

local ok, session = pcall(require, "auto-session")
if not ok then
	vim.notify("auto-session is not install!")
	return
end


vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
session.setup {
  log_level = "error",
	auto_session_enabled = true,
	auto_save_enabled = nil,
	auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_suppress_dirs = { "~/Projects", "~/Downloads" },
}
