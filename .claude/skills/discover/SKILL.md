---
name: discover
description: Run discovery on one hypothesis. The Researcher writes the discovery brief, then a separate Critic challenges it. Run only when the product owner types /discover followed by a hypothesis ID, such as /discover HYP-001.
argument-hint: <hypothesis ID, e.g. HYP-001>
disable-model-invocation: true
---

Run discovery on hypothesis: $ARGUMENTS

If no hypothesis ID was given, or `hypotheses/<ID>.md` does not exist, stop and tell the product owner which hypotheses exist.

1. **Researcher.** Start a separate agent with the Agent tool. Tell it to act as the Researcher by reading [agents/researcher.md](../../../agents/researcher.md) and following its steps, rules and definition of done exactly, for the given hypothesis.
2. **Critic.** When the Researcher has finished, start a second, separate agent. Tell it to act as the Critic by reading [agents/critic.md](../../../agents/critic.md) and following it for `discovery/<ID>-brief.md`. The Critic must be a different agent from the Researcher.
3. **Revision.** When the Critic has finished, start a third agent. Tell it to act as the Researcher by reading [agents/researcher.md](../../../agents/researcher.md) and following its "Revising after critique" section for `discovery/<ID>-brief.md`.

Then report to the product owner in plain language:
- the path of the brief
- the Researcher's recommendation, in two or three sentences
- the Critic's verdict and any blocking or important issues
- how the revision handled each issue, and the final recommendation
- any competitors the Researcher found missing from the radar
