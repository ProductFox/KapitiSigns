---
name: decide
description: Record the product owner's Park, Promote or Kill decision on a hypothesis, in the product owner's own words. Run only when the product owner types /decide followed by a hypothesis ID and the decision.
argument-hint: <ID> <Park|Promote|Kill> <reasoning and condition>
disable-model-invocation: true
---

The product owner's decision: $ARGUMENTS

You are recording a decision, not making one. Never change, soften or add to the product owner's reasoning.

1. **Check the inputs.** The hypothesis ID must exist and `decisions/<ID>-pack.md` must exist with status `checked`. The decision must be exactly one of Park, Promote or Kill. If anything is missing or unclear, ask the product owner and stop.
2. **Check the condition.** Park needs a revisit trigger. Promote needs a prototype question. Kill needs a reason. If it is missing, ask the product owner for it (you may offer the pack's suggested condition as an option) and stop until the product owner answers.
3. **Record it in the pack.** Fill in the Decision section with the product owner's words and today's date. Leave "Delivery tier" as "n/a until build step 8" unless the product owner gave one. Set the pack's `status` to `decided` and `decision` to the decision.
4. **Log it.** Add one row to [decisions/decision-log.md](../../../decisions/decision-log.md), following [templates/decision-log-entry.md](../../../templates/decision-log-entry.md). Never edit past rows.
5. **Update the hypothesis.** Set its status to `parked`, `promoted` or `killed`, update `updated`, and add a History row.
6. **Confirm** to the product owner exactly what was recorded and where.
