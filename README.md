# Homebrew Tap

Homebrew formulae for Cameron's projects.

## Usage

```bash
brew tap cameronsjo/tap
brew install cadence-hooks
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `cadence-hooks` | Compiled Claude Code enforcement hooks (cadence ecosystem) |
| `go-unifi-mcp` | MCP server for UniFi Network Controller |

## Verifying an installed binary

`cadence-hooks` is a security-control binary — it decides whether the agentic harness
lets a `git push`, a `gh` write, or an edit-on-`main` through. Each release is signed and
carries SLSA build provenance, and this tap's update workflow **verifies that provenance
before it pins a new version** (a tampered update dispatch can't slip a bad binary past
the gate).

You can verify the binary you have installed came from the genuine release workflow.
Requires the [`gh` CLI](https://cli.github.com/) (v2.49+):

```bash
# Locate the installed archive in Homebrew's cache, or re-download the release asset:
gh release download "v$(cadence-hooks --version | awk '{print $2}')" \
  -R cameronsjo/cadence-hooks --pattern 'cadence-hooks-v*-macos-aarch64.tar.gz'

gh attestation verify cadence-hooks-v*-macos-aarch64.tar.gz -R cameronsjo/cadence-hooks
```

A passing run prints `✓ Verification succeeded!` and the workflow identity that built it.
For the full verification story — the OIDC identity, the CycloneDX SBOM, and an offline
`cosign verify-blob` path that doesn't depend on GitHub — see
[`cadence-hooks/SECURITY.md`](https://github.com/cameronsjo/cadence-hooks/blob/main/SECURITY.md).
