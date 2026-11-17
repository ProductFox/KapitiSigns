---
name: update-engine
description: Bring this project's engine (agents, templates, commands, scripts, ENGINE.md) up to date with the skeleton repository, keeping all project files. Run only when the product owner types /update-engine.
disable-model-invocation: true
---

Update this project's engine from the skeleton. Explain each step plainly and do not push anything until the product owner approves.

Engine files: ENGINE.md, ENGINE_VERSION, CHANGELOG.md, agents/, templates/, scripts/, .claude/skills/, and the README.md inside each subfolder (not the top-level README.md).
Project files, never overwritten: CLAUDE.md, the top-level README.md, product.md, .env, radar/competitors/excluded.md, and all content in hypotheses/, radar/, discovery/, decisions/, prototypes/, specs/ and design-system/ (other than folder README.md files).

1. **Check the working tree is clean** (`git status`). If there are unsaved changes, list them and ask the product owner whether to commit them first. Stop until that is done.
2. **Check the upstream link.** `git remote get-url upstream` must point to the skeleton repository. If it is missing, ask the product owner for the skeleton's address (the README names it) and add it with `git remote add upstream <address>`.
3. **Fetch and compare.** Run `git fetch upstream`. Compare this project's ENGINE_VERSION with `git show upstream/main:ENGINE_VERSION`. If they match and `git diff HEAD upstream/main --stat -- <engine files>` shows nothing, say the engine is up to date and stop.
4. **Show what changed.** Show the CHANGELOG.md entries between the two versions, and list the engine files that will change.
5. **Merge.** Run `git merge upstream/main --no-commit`. If this is the first update for a project whose history is not yet linked to the skeleton, use `--allow-unrelated-histories` and tell the product owner this is a one-off.
6. **Resolve conflicts.** For engine files, take the skeleton's version (`git checkout --theirs <file>`). For project files, keep this project's version (`git checkout --ours <file>`). If a file does not fit either list, show it to the product owner and ask.
7. **Check nothing project-specific was lost.** Confirm product.md, CLAUDE.md, radar/competitors/excluded.md and content folders are unchanged by the merge (`git diff --cached --stat`). If anything changed, restore it and explain.
8. **Ask for approval,** then commit with the message "Update engine to <version>" and push.
9. **Report** the old and new versions, the changelog entries now in effect, and anything the product owner should do differently because of them.
