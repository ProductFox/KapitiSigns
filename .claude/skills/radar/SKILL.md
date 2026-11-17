---
name: radar
description: Run a market radar sweep. The Radar sweeper finds changes and updates competitor files, then the Digest agent writes the weekly digest. Run only when the product owner types /radar, or from the weekly schedule.
disable-model-invocation: true
---

Run the market radar in stages, in order. Each stage works only from files, not from this conversation.

1. **Radar sweeper.** Read [agents/radar-sweeper.md](../../../agents/radar-sweeper.md) and follow its steps, rules and definition of done exactly.
2. **Digest.** When the change list is saved, read [agents/digest.md](../../../agents/digest.md) and follow its steps, rules and definition of done exactly.
3. **SWOT, only if needed.** If the change list records any threat rating change, read [agents/swot.md](../../../agents/swot.md) and follow it to refresh `radar/swot.md`.

Then report to the product owner in plain language:
- the paths of the change list and the digest
- any parked ideas to revisit, first
- the digest's Summary
- the number of changes found, and how many were Threatens, Supports, Product-wide pulse, Context and Rejected
- any threat rating changes and possible new competitors that need the product owner's decision
- the "Possible SWOT changes" from the digest, and whether the SWOT was refreshed
