# Market radar

The weekly market radar. It tracks the market as a whole and each competitor.

- `landscape.md`: market map and competitive advantage summary. Updated by the Digest agent with context changes.
- `swot.md`: product SWOT, written by the SWOT agent. Refreshed monthly and after any threat rating change.
- `competitors/`: one file per competitor.
- `changes/`: one change list per sweep, written by the Radar sweeper and read by the Digest agent.
- `digests/`: one weekly digest per sweep.

The radar runs weekly on a schedule. Only changes are written up. Unchanged facts get a refreshed check date.
