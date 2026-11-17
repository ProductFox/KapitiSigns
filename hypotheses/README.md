# Hypotheses

One file per hypothesis. Each file describes a problem worth investigating, not a solution.

- **Naming:** `HYP-001.md`, `HYP-002.md` and so on, numbered in order. Never reuse a number, even for killed hypotheses.
- **Written by:** Intake agent
- **Template:** [templates/hypothesis.md](../templates/hypothesis.md)
- **Read by:** Researcher, Digest
- **Tags:** chosen from [tags.md](tags.md) only. New tags need the product owner's approval.
- **How to add one:** type `/intake` in Claude Code, followed by the raw input.

## Status values

A hypothesis moves through these in order:

`new` > `in discovery` > `awaiting decision` > `parked`, `promoted` or `killed` > `in prototype` > `in spec` > `in build` > `live`

Only the product owner moves a hypothesis to `parked`, `promoted` or `killed`.
