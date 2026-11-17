# ENGINE.md: Agent-Assisted Product Workflow

The workflow rules every project shares. Each project's CLAUDE.md imports this file. Do not edit it inside a project: change it in the skeleton repository and run /update-engine. The engine version is in ENGINE_VERSION.

The product owner is named in the project's CLAUDE.md and product.md. The product owner makes every Park, Promote or Kill decision and every spec sign-off. Claude builds and runs the structure, agents and automations described here.

## Core principles

1. **Documents hold context, not agents.** Every stage reads the previous stage's artefact and writes its own. No agent relies on conversation memory.
2. **Maker and checker.** Every piece of research or drafting is produced by one agent and challenged by a separate critic agent.
3. **Humans decide.** Agents never make Park, Promote or Kill calls or sign off specs. The product owner does, and the reasoning is logged.
4. **Every claim has a source.** Research findings without a source are not allowed.
5. **Confidence is explicit.** Findings are rated strong, weak or unknown.

## Repository structure

```
CLAUDE.md               project instructions: product owner, working agreement, open decisions (project file)
ENGINE.md               these shared workflow rules (engine file)
ENGINE_VERSION          engine version number (engine file)
CHANGELOG.md            what changed in each engine version (engine file)
product.md              what our product is, its suite, buyers, markets and status (project file, from templates/product.md)
/scripts/               helper scripts, such as exa-search.sh for web search
/hypotheses/            one file per hypothesis (HYP-001.md ...)
  tags.md               approved tags, plus proposed tags awaiting the product owner
/radar/
  landscape.md          market map and competitive advantage summary
  swot.md               product SWOT, refreshed monthly and after threat changes
  /competitors/         one file per competitor
    excluded.md         organisations never to treat as competitors (project file)
  /changes/             change list per sweep (YYYY-MM-DD.md)
  /digests/             weekly digests (YYYY-MM-DD.md)
/discovery/             discovery briefs per hypothesis
/decisions/             decision packs and decision log
  decision-log.md
/prototypes/            prototype briefs, builds, findings
/specs/                 engineering specs and slices
/design-system/
  backlog.md            gaps found during prototyping
/agents/                prompt and role files for each agent
/templates/             templates for every artefact below
```

## Reuse across products and customers

This engine is kept in one skeleton repository. Every product or customer project is created from it and pulls engine updates from it.

- Engine files are product-neutral: no product names, markets, priorities or people written into them. Agents read all of that from product.md and the project's CLAUDE.md.
- Engine files: ENGINE.md, ENGINE_VERSION, CHANGELOG.md, agents/, templates/, scripts/, .claude/skills/ and the README.md inside each subfolder (not the top-level README.md). Change them only in the skeleton, then run /update-engine in each project.
- Project files: CLAUDE.md, the top-level README.md, product.md, .env, radar/competitors/excluded.md, and all content (hypotheses, radar, discovery, decisions, prototypes, specs, design system backlog).
- Each product or customer gets its own repository. Customer data never shares a repository with another customer or product.
- Start a project with /new-project. Update a project's engine with /update-engine.

## Agents to build

Each agent gets a role file in /agents/ that states its single job, the files it reads, the file it writes, its template, and its definition of done.

| Agent | Reads | Writes |
| --- | --- | --- |
| Intake | raw input | /hypotheses/HYP-xxx.md |
| Researcher | hypothesis, radar | /discovery/HYP-xxx-brief.md |
| Critic | discovery brief, product SWOT | critique section in that file |
| Radar sweeper | competitor files | updated competitor files, change list |
| Digest | change list, hypotheses | /radar/digests/ |
| SWOT | product.md, radar | /radar/swot.md |
| Decision pack | brief, critique, radar | /decisions/HYP-xxx-pack.md |
| Critic (faithfulness check) | decision pack, brief | faithfulness check in pack |
| Prototype brief | decision pack | /prototypes/HYP-xxx/brief.md |
| Builder | prototype brief, design system | prototype code |
| Findings | user test notes | /prototypes/HYP-xxx/findings.md |
| Spec writer | pack, findings, prototype | /specs/HYP-xxx/spec.md |
| Spec reviewer | spec | review notes in spec |
| Feasibility | spec | feasibility notes in spec |

## Templates

### Hypothesis

Fields: ID, source (customer, internal, other), problem, who has it, what we believe, evidence that would prove us wrong, tags (problem space, segment, advantage bet), status.

The Intake agent works back from any proposed solution to the underlying problem: who has it, how often, and what it costs them.

### Competitor file

Sections: Snapshot, Offering, Evidence (each item sourced and dated), Head to head, Signals, Threat rating (low, medium or high, with reason and review date).

### Discovery brief

Sections: hypothesis summary, market research, competitor analysis, SWOT, findings with sources and confidence ratings, recommendation, critic's challenge.

The Researcher searches by problem as well as by competitor name to find indirect substitutes. Run discovery with /discover HYP-xxx: the Researcher writes the brief, then a separate Critic challenges it, spot-checking sources and rating each issue blocking, important or minor.

### Decision pack (one page)

Sections: problem and evidence, competitive position, the case against, what it would take, delivery risk assessment (scores and recommended tier). Ends with a blank decision field for the product owner: Park (with revisit trigger), Promote (with prototype question), or Kill (with reason). Build it with /pack HYP-xxx: the Decision pack agent writes it, including the Critic's unresolved points and balanced options, then the Critic checks it is faithful to the brief. The product owner records the decision with /decide, which fills in the pack, adds a decision log row and updates the hypothesis status. The Digest flags parked ideas whose revisit trigger is met.

### Prototype brief

Sections: the question to answer, key user flows, success criteria, design system components to use.

### Spec

Sections: context (linked to decision pack), user stories with given/when/then acceptance criteria, prototype reference, constraints, non-goals, bounded slices (each fits one agent's context and has its own tests), review notes, feasibility notes, the product owner sign-off.

## Market radar

- Runs weekly on a schedule.
- Covers two layers: product-wide (competitive position, new entrants, adjacent players, regulation and technology shifts) and hypothesis level.
- Sources to sweep: pricing pages, release notes, launches, job ads, funding news, reviews. Use a semantic search API such as Exa for research and sweeps.
- Only changes are written up. Unchanged facts get a refreshed check date.
- The Digest agent sorts each change into Threatens, Supports or Context using hypothesis tags. Threatens goes first, then Supports, then a product-wide pulse. Context changes update landscape.md only.

## Product SWOT

- The SWOT agent keeps one product-level SWOT in /radar/swot.md, refreshed monthly and whenever a radar sweep changes a threat rating.
- Opportunities and threats come from the radar, with sources. Strengths and weaknesses come from product.md or from the product owner. Anything unsourced is marked "Needs the product owner's input" and is never treated as fact.
- The Digest flags weekly changes that should alter the SWOT. The Researcher starts each hypothesis SWOT from it, and the Decision pack draws on both.
- The Critic challenges every new SWOT version (run /critique radar/swot.md). The product owner reviews both.

## Design system validation

After each prototype, the Findings agent logs to /design-system/backlog.md: components that worked, where users struggled, and anything the Builder had to invent because no component fitted.

## Delivery risk assessment

Add a Delivery risk agent. It reads the discovery brief and writes a section into the decision pack.

It scores each idea low, medium or high on six factors: data sensitivity, money handling, regulation, architecture novelty, reversibility, and exposure (internal or customer-facing).

It recommends one tier:

- **Fully automated.** Low-risk, standard, reversible work. Agents build, review, harden and deploy, with the product owner approving production releases.
- **Checkpoint review.** A contract engineer reviews architecture setup and pre-launch.
- **Human-led.** Money or sensitive data. An engineer is involved throughout and agents assist.

The product owner confirms or overrides the tier at the review gate. The tier is recorded in the decision log and copied into the spec.

## Engineering stage

Assume the product owner is not an engineer unless the project's CLAUDE.md says otherwise. Claude explains every engineering choice in plain language and defaults to automated checks.

1. **Build.** One engineering agent per bounded slice. Tests are written first from the acceptance criteria. A separate code-review agent reviews every change.
2. **Harden.** Automated on every change: security scanning, dependency checks, performance and load tests, error handling and logging, checks against spec constraints.
3. **Deploy.** A pipeline releases to a test environment, then to production in small steps, with monitoring and one-step rollback. The product owner approves every production release.

Human engineer checkpoints, regardless of tier: first architecture setup, before handling real customer data or money, and a monthly review. Higher tiers add more, as above.

Agents use proven, mainstream technology and standard hosting platforms. Claude flags any proposal to use something new or unusual for the product owner to decide.

Add these agents to the agent list: Delivery risk, Engineering builder, Code reviewer, Hardening, Deployment.

## Build order

Claude proposes this order to the product owner for approval before starting:

1. Repository structure and templates.
2. Intake agent and hypothesis files.
3. Competitor files, Radar sweeper and Digest agent, with the weekly schedule.
4. Researcher and Critic agents.
5. Decision pack agent and decision log.
6. Prototype brief, Builder and Findings agents.
7. Spec writer, Spec reviewer and Feasibility agents.

Each step ends with a working example run on one real hypothesis, reviewed with the product owner before moving on.

After step 7, add two more steps: (8) the Delivery risk agent and tiering in the decision pack, and (9) the engineering pipeline: build, code review, hardening and deployment, with a human engineer reviewing the architecture before it is used for real work.
