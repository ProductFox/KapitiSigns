# Decisions

Decision packs and the decision log.

- **Naming:** `HYP-001-pack.md` for packs. The log is `decision-log.md`.
- **Written by:** Decision pack agent (packs), the Critic (faithfulness check), Delivery risk agent (risk section, build step 8). The product owner's decision is recorded with `/decide`.
- **How to make one:** `/pack HYP-001` builds and checks the pack. Then `/decide HYP-001 Park|Promote|Kill` with your reasoning and condition records your decision.
- **Templates:** [templates/decision-pack.md](../templates/decision-pack.md), [templates/decision-log-entry.md](../templates/decision-log-entry.md)
- **Read by:** The product owner, Prototype brief, Spec writer

Agents never make Park, Promote or Kill decisions. The product owner does, and the reasoning goes in the log.
