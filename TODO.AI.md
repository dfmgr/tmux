# TODO

Pre-existing script-lint violations found while running the lint gate for
the clipboard-passthrough commit. Not part of that change's working set
(no `.conf` files were flagged) — logged here instead of fixed inline.

## install.sh
- line 54: `grep` missing `--` before query
- line 92: `grep` missing `--` before query
- line 93: `grep` missing `--` before query
- line 100: `grep` missing `--` before query (three instances in a `ps` pipeline)
- line 73: `exit 90` outside standard ranges (0-2/64-78/128-143)
- line 90: `__failexitcode()` default exit code 4 outside standard ranges

## etc/scripts/renew_env.sh
- missing `##@Version` header line

## etc/scripts/yank.sh
- line 5: function `cmd_exists()` missing required `__` prefix (should be `__cmd_exists()`)
- missing `##@Version` header line
- line 27: `grep` missing `--` before query
- line 34: bare `exit` (no code)
- line 40: bare `exit` (no code)
