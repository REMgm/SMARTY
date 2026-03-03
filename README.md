# SMARTY — Strategic MarTech Architecture for Real-Time Yield

> Monks | AI-First MarTech Transformation & CX-Performance

---

## What is this?

SMARTY is the operational architecture powering Monks' AI-first marketing ecosystems. This repo contains the published architecture narrative, AR0A readiness artifacts, branding assets, and deployment tooling.

## Repo Structure

```
SMARTY/
  architecture.md          # Narrative architecture (Markdown)
  architecture.html        # Branded web page (Monks dark theme)
  index.html               # Landing redirect → architecture.html
  logo.jpg                 # Monks branding asset (add manually)
  README.md                # This file
  vercel.json              # Vercel static hosting config
  vercel-deploy.sh         # Vercel deploy script (loads token from secrets)
  publish-gh-pages.sh      # GitHub Pages publish script
  AR0A_OnePager.txt        # External outreach one-pager
  AR0A_Intake_Form.txt     # Internal intake form copy
  AR0A_GoogleDocs_Outline.txt  # Slide deck outline
  MonksArch.dot            # Graphviz architecture diagram (source)
  MonksArch.svg            # Rendered diagram
  memory/
    pins.md                # Pins ledger (strategic decisions)
    strategy/
      monks4.0_v1.md       # Monks 4.0 brand & strategy alignment
```

## Branding

- **Theme:** Monks 4.0 dark — deep navy (#0a0a0f), electric purple (#6c5ce7), teal accents (#00cec9)
- **Typography:** Inter (Google Fonts)
- **Logo:** Place `logo.jpg` in repo root. Uncomment the `<img>` tag in `architecture.html` header.

## Deployment

### GitHub Pages (Primary)

```bash
chmod +x publish-gh-pages.sh
bash publish-gh-pages.sh
```

Then in GitHub: **Settings > Pages > Source: main, root**
URL: `https://REMgm.github.io/SMARTY/`

### Vercel (Preview/Production)

1. Create `~/.secrets/vercel.env`:
   ```
   VERCEL_TOKEN=your_actual_token
   ```
2. Secure it: `chmod 600 ~/.secrets/vercel.env`
3. Deploy:
   ```bash
   chmod +x vercel-deploy.sh
   bash vercel-deploy.sh
   ```

### Rendering the Diagram (optional)

```bash
dot -Tsvg MonksArch.dot -o MonksArch.svg
```

## Security

- **No secrets in this repo.** Tokens load from `~/.secrets/` at runtime.
- Rotate tokens immediately if compromised.
- `.gitignore` excludes secret files and OS artifacts.

## Pins

Strategic decisions tracked in `memory/pins.md`. Pins feed the 21:00 daily digest cadence. Reference format: `Pin: {ID} | Status: {Active|Draft|Pending|Resolved}`

---

*Monks | MarTech AI Transformation & CX-Performance*
