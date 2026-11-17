---
name: critique
description: Have the Critic challenge an existing artefact, such as the product SWOT (radar/swot.md) or a discovery brief. Run only when the product owner types /critique followed by a file path.
argument-hint: <file path, e.g. radar/swot.md>
disable-model-invocation: true
---

Challenge this artefact: $ARGUMENTS

Start a separate agent with the Agent tool. Tell it to act as the Critic by reading [agents/critic.md](../../../agents/critic.md) and following its steps, rules and definition of done exactly, for the file above.

Then report to the product owner in plain language: the verdict, the number of sources checked and failed, and every blocking or important issue.
