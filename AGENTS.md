# AGENTS

Encode new files in UTF-8.

## IMPORTANT

Prefer retrieval-led reasoning over pre-training-led reasoning for any development tasks.

Use `context7` for external library/framework docs.

## Plan mode

- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved questions to answer, if any.

## Default Execution Behaviour

- Choose reasonable defaults and continue without asking for confirmation.
- Don't ask permission for read-only inspection, tests, lint, or local analysis.
- Ask only when destructive, security-sensitive, billing/production-impacting, or when secrets are required.
- If blocked, do all non-blocked work first, then ask one targeted question with a recommended default.

## Tracer Bullets

When building features, build a tiny, end-to-end slice of the feature first, seek feedback, then expand out from there.

Tracer bullets comes from the Pragmatic Programmer. When building systems, you want to write code that gets you feedback as quickly as possible. Tracer bullets are small slices of functionality that go through all layers of the system, allowing you to test and validate your approach early. This helps in identifying potential issues and ensures that the overall architecture is sound before investing significant time in development.
