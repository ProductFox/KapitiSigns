# Templates

One template per artefact. Agents copy the template, then fill it in. Do not edit a template to suit one case. Change the template only when the change should apply to every future file.

| Template | Used for | Saved to |
| --- | --- | --- |
| `hypothesis.md` | A problem worth investigating | `hypotheses/` |
| `competitor.md` | One competitor's profile | `radar/competitors/` |
| `change-list.md` | Changes found in one radar sweep | `radar/changes/` |
| `digest.md` | Weekly radar digest | `radar/digests/` |
| `landscape.md` | Market map | `radar/landscape.md` |
| `swot.md` | Product SWOT | `radar/swot.md` |
| `discovery-brief.md` | Research and critique | `discovery/` |
| `interview-guide.md` | Customer interview guide and notes template | `discovery/` |
| `decision-pack.md` | One-page decision summary | `decisions/` |
| `decision-log-entry.md` | One row in the decision log | `decisions/decision-log.md` |
| `prototype-brief.md` | What a prototype must answer | `prototypes/HYP-xxx/` |
| `prototype-findings.md` | What testing showed | `prototypes/HYP-xxx/` |
| `spec.md` | Engineering spec | `specs/HYP-xxx/` |
| `product.md` | Description of the product this repo works on | `product.md` (main folder) |
| `agent-role.md` | An agent's role file | `agents/` |

The block between the `---` lines at the top of each template holds labelled details such as ID, status and tags. Agents use it to find and sort files. Keep the labels exactly as written.
