# Product pipeline skeleton

An agent-assisted product workflow that takes an idea from first input to a released product. Agents research, draft and check. The product owner makes every Park, Promote or Kill decision and signs off every spec. Each stage reads the previous stage's document and writes its own, so documents hold the context, not the agents.

This repository is the **skeleton**: the shared engine with no project content. Every product or customer project is created from it.

- Shared workflow rules: [ENGINE.md](ENGINE.md)
- Engine version: [ENGINE_VERSION](ENGINE_VERSION), with changes in [CHANGELOG.md](CHANGELOG.md)
- Skeleton address: `git@github-productfox:ProductFox/product-pipeline-skeleton.git`

## Start a new project

1. On GitHub, open this repository and choose **Use this template**, then **Create a new repository**. Give it the project's name and make it **Private**.
2. Clone the new repository to your computer and open it in VS Code.
3. In Claude Code, type `/new-project`. Claude guides you through describing the product, setting up the search key, seeding the market radar and writing the first SWOT.

Each project gets its own private repository. Never put two customers in one repository.

## Keep a project up to date

Make engine changes in this skeleton only. Then, in each project, type `/update-engine`. Claude pulls the new engine, keeps all project files, and shows you what changed before saving.

## Commands

| Command | What it does |
| --- | --- |
| `/new-project` | Set up a fresh project |
| `/intake` | Turn raw input into a hypothesis |
| `/radar` | Run a market radar sweep and digest |
| `/swot` | Refresh the product SWOT |
| `/critique <file>` | Have the Critic challenge any artefact |
| `/discover <HYP-xxx>` | Research a hypothesis, critique it and revise it |
| `/pack <HYP-xxx>` | Build and check a one-page decision pack |
| `/decide <HYP-xxx> ...` | Record the product owner's decision |
| `/update-engine` | Pull the latest engine from the skeleton |

## Setting up secrets

Copy `.env.example` to `.env` and add your Exa API key. `.env` is never uploaded to GitHub.
