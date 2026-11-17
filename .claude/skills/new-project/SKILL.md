---
name: new-project
description: Set up a fresh project created from the product pipeline skeleton. Guides the product owner through product.md, CLAUDE.md, the Exa key, seeding the radar, the first SWOT and saving to GitHub. Run only when the product owner types /new-project.
disable-model-invocation: true
---

Set up this repository as a new project. Follow the working agreement in CLAUDE.md throughout: plan first, ask one question at a time, explain each step plainly, and wait for approval before anything hard to undo.

## 0. Check this is a fresh copy

- `product.md` must still be the blank template (its first heading is "Our product: Product name") and `hypotheses/` must hold no `HYP-*.md` files. If not, stop and tell the product owner this project already looks set up.
- Read ENGINE_VERSION and tell the product owner which engine version this project starts on.
- Show the plan below and ask to go ahead.

## 1. Project basics (CLAUDE.md)

Ask, one at a time: the product owner's name, how familiar they are with git and developer tools (adjust the working agreement if they are experienced), and any writing style rules. Update the "This project" and "Working agreement" sections of CLAUDE.md. Never edit ENGINE.md.

## 2. The product (product.md)

Fill in product.md from templates/product.md by asking one question at a time: what it is and the vision, the suite and the status of each part, who uses it, who buys it in each market (confirmed or current thinking), markets in priority order, principles, and what is not in scope. Use the product owner's words. Show the finished file for approval.

## 3. Search key (.env)

- Check `.env` exists and has a real `EXA_API_KEY` without printing the key: run `scripts/exa-search.sh "test" --num 1`.
- If it fails, give step-by-step instructions to copy `.env.example` to `.env` and paste the key. The product owner types the key; never ask for it in chat. A separate Exa key per project or customer keeps costs separate.

## 4. Seed the radar

1. Ask for the product areas to watch, the markets, any known competitors, and any organisations that must never count as competitors (record those in `radar/competitors/excluded.md` with the reason and date).
2. Search for likely competitors in each area and market with `scripts/exa-search.sh`. Show a shortlist table (name, market, what it does, source) with a suggested starting set of 10 to 15. The product owner chooses.
3. For the chosen competitors, start separate agents with the Agent tool, about five competitors each, to write `radar/competitors/<name>.md` from templates/competitor.md. Each must read product.md, ENGINE.md (Core principles, Market radar), the competitor template and `radar/competitors/excluded.md`, fill Head to head from product.md, judge threat against product.md (markets, timing, buyers), and give every evidence item a source and date.
4. Check every file: all six template sections, sources on every evidence row, a threat rating, no em dashes. Then start one agent to write `radar/landscape.md` from templates/landscape.md, reading every competitor file and product.md.
5. Ask the product owner to review the threat ratings and landscape.

## 5. First product SWOT

Start an agent to act as the SWOT agent (agents/swot.md). Then start a separate agent to act as the Critic on `radar/swot.md` (agents/critic.md). Then start a third agent as the SWOT agent to address the critique. Show the result and the Questions for the product owner.

## 6. Weekly schedule (optional)

Explain the two options: run `/radar` by hand, or a weekly cloud schedule. For the cloud schedule, the product owner must give Claude's GitHub app access to this repository, add `EXA_API_KEY` to the cloud environment, and allow `api.exa.ai` in its network access settings. Only create a schedule if the product owner asks.

## 7. Save

- Rewrite the top-level README.md for this project: what the product is, the product owner, and a pointer to ENGINE.md and the commands. It currently describes the skeleton.
- Commit everything with a clear message. Never commit `.env`.
- If the repository has no GitHub remote yet, give step-by-step instructions for creating a private repository and connecting it, then push.
- Check that a remote called `upstream` points to the skeleton repository (see the README). If not, add it, so /update-engine works later.

## 8. Report

Summarise what was set up, what the product owner still needs to decide (open decisions and SWOT questions), and the next step: run `/intake` with a first real input.
