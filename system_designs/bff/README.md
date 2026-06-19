# Backend For Frontend (BFF)

Overview
- A Backend For Frontend is a dedicated backend layer tailored to the needs of a specific client or client class (e.g. mobile app, web UI).

Benefits
- Client-specific API shaping: aggregate and tailor responses to reduce client-side logic and bandwidth.
- Encapsulation of client concerns: authentication flows, composition, caching, and protocol translation.
- Independent evolution: teams can change client-facing APIs without affecting core services.

Trade-offs / Costs
- Increased maintenance: multiple BFFs create duplication of composition logic and cross-cutting concerns.
- Operational surface area: more services to monitor, secure and deploy.
- Potential for inconsistent behaviour: if logic is duplicated across BFFs, divergence can occur unless shared libraries/policies are used.
- Latency and extra hop: BFF adds one network hop; mitigate with co-location, caching, and efficient protocols.

When to use a BFF
- Multiple client types with different data or interaction patterns (e.g. mobile vs web).
- Need to minimize data transfer or request/response shapes for constrained clients.
- When you must centralize client-specific authorization, feature toggles, or A/B logic.

When to avoid
- Single client surface with simple requirements — added complexity may not be justified.
- When a lightweight API gateway can handle composition and protocol translation.

Implementation notes
- Prefer small, thin BFFs that delegate business logic to backend services.
- Share common composition logic via libraries or a shared service to avoid duplication.
- Add robust monitoring, tracing, and end-to-end tests covering cross-service flows.

References
- Martin Fowler — Backend For Frontend pattern
