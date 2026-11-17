---
name: pack
description: Build the one-page decision pack for a researched hypothesis, then have the Critic check it is faithful to the brief. Run only when the product owner types /pack followed by a hypothesis ID, such as /pack HYP-001.
argument-hint: <hypothesis ID, e.g. HYP-001>
disable-model-invocation: true
---

Build the decision pack for: $ARGUMENTS

If no ID was given, or `discovery/<ID>-brief.md` does not exist, stop and tell the product owner which briefs exist.

1. **Decision pack.** Start a separate agent with the Agent tool. Tell it to act as the Decision pack agent by reading [agents/decision-pack.md](../../../agents/decision-pack.md) and following its steps, rules and definition of done exactly, for the given hypothesis.
2. **Faithfulness check.** When it has finished, start a second, separate agent. Tell it to act as the Critic by reading [agents/critic.md](../../../agents/critic.md) and following its "Decision pack mode" for `decisions/<ID>-pack.md`.
3. **Fix, only if needed.** If the verdict is "needs changes", start a third agent. Tell it to act as the Decision pack agent and follow its "Responding to a faithfulness check" section.

Then report to the product owner in plain language:
- the path of the pack
- a three-sentence summary of the problem, the evidence and the case against
- the three options as the pack states them
- the faithfulness verdict and what was fixed
- that the decision is the product owner's, recorded with `/decide <ID> <decision and reasoning>`
