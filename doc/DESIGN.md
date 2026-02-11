# Project Design Goals

There are many aspects of the project design that are well-known to experienced contributors, but
are hidden among many previous discussions, commit messages, presentations etc. It's helpful to have some of them written down.

This is not intended to be comprehensive. The topics mentioned here are enduring concepts, but of course are always open for debate or change.

## Audience

The primary audience for the website are the OpenStreetMap community members. This mean we priorise things that are required for this audience, such as signing up for an account, carry out mapping, and other community activities. Features are generally prioritised on the needs of the administrators, moderators, and the wider mapping community.

Other audiences are generally not prioritised. This includes people looking for a general-purpose end-user mapping site (e.g. planning their own travel).

## Developers

We want to make it as easy as practicable for developers to contribute. Most of our developers come from an OpenStreetMap background, are often unfamiliar with Ruby and/or Rails, and often only have limited time to learn the codebase beyond their immediate needs.

To help them, we keep our code as straightforward as we can. We follow widespread conventions, so that when they find documentation elsewhere it is likely to be applicable. We also provide an extensive set of checks and linting, both in CI and ideally with editor integration, so that they can get immediate and actionable feedback on their code changes.
