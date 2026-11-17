# Engine changelog

Changes to the shared engine. Each project records the version it runs in ENGINE_VERSION. Run /update-engine in a project to bring it up to date.

## 1.0.1 (2026-11-17)

- The top-level README.md is now a project file, not an engine file. /new-project rewrites it for the project, and /update-engine never overwrites it.

## 1.0.0 (2026-11-17)

First skeleton release.

- Steps 1 to 5 of the build order: structure and templates, Intake, market radar (Radar sweeper, Digest, weekly schedule), product SWOT, Researcher and Critic with a revision step, Decision pack with a faithfulness check, and /decide.
- Commands: /intake, /radar, /swot, /critique, /discover, /pack, /decide, /new-project, /update-engine.
- Interview guide template for testing hypotheses with customers.
- Engine files are product-neutral and refer to "the product owner", named in each project's CLAUDE.md and product.md.
- The excluded organisations list is a project file: radar/competitors/excluded.md.
