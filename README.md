# Kamrul Hassan — Portfolio

Personal portfolio of **Kamrul Hassan**, Full-Stack Developer and CSE undergraduate (Manarat International University, 2027), based in Dhaka, Bangladesh.

A static website (plain HTML/CSS/JS, no build step) with scroll animations, dark/light theme, a command palette, project case studies, an owner-only **admin panel** and optional **live visitor analytics**.

**Live site:** https://kamrul102.github.io/portfolio/ *(update if your URL differs)*

## Features

- Responsive design with smooth scroll-reveal animations (respects `prefers-reduced-motion`)
- Dark / light theme, command palette, printable CV modal, project case-study drawer
- Certificates section driven by `content.json` (images, credential links, reordering)
- Admin panel at `/admin.html` to edit text, certificates and profile without touching code
- Optional live analytics: viewers right now, views today, last 7 days, total, device split

## Project structure

| File | Purpose |
| --- | --- |
| `index.html` | The public portfolio |
| `admin.html` | Owner-only editor + analytics dashboard (not indexed by search engines) |
| `content.json` | Created by the admin panel on first publish; holds edited text, certificates and settings |
| `certs/` | Certificate images uploaded through the admin panel |
| `404.html` | Not-found page |
| `Kamrul-Hassan-CV.pdf`, `og.png`, `portrait.jpg` | Assets |

## Deploy on GitHub Pages

1. Upload all files to a **public** repository.
2. **Settings → Pages → Deploy from a branch → `main` / `(root)` → Save.**
3. After a minute the site is live at `https://<username>.github.io/<repo>/`.

## Admin panel

Open `https://<your-site>/admin.html`.

1. Create a **fine-grained personal access token**: GitHub → Settings → Developer settings → Fine-grained tokens. Select **only this repository** and set **Contents → Read and write**.
2. In the admin panel click **🔐 GitHub** and enter username, repository, branch (`main`) and the token. The token is stored only in your browser.
3. Click **✏️ Edit mode**, click any text to change it, use **＋ Certificate** to add certificates, then press **🚀 Publish**. The host redeploys in about a minute.

No GitHub token? Use **⬇ content.json** and upload that file next to `index.html` manually.

**Who can change the site:** only someone holding your GitHub token can publish. Anyone else who opens `admin.html` can only change their own local view. Keep the token private, remove it from shared computers (**Remove token**), and revoke it on GitHub if it leaks.

## Live analytics (optional, free)

Uses the Firebase Realtime Database REST API; no server or SDK is needed.

1. Firebase console → create a project → **Build → Realtime Database → Create Database** (locked mode).
2. In **Rules**, paste and publish:

```json
{
  "rules": {
    ".read": false, ".write": false,
    "stats":    { ".read": true, ".write": true },
    "presence": { ".read": true, ".write": true }
  }
}
```

3. In the admin panel click **⚙ Connect analytics**, paste the database URL (`https://…firebasedatabase.app` or `…firebaseio.com`), Save, then **Publish** once so visitors start being counted.

Notes: the `stats` and `presence` paths are publicly writable, so someone could inflate the numbers (they hold no private data). A visitor counts as "viewing now" for about 50 seconds after their last heartbeat. Counting starts after you connect; earlier visits are not included.

## Editing code directly

Site-wide settings (email, GitHub, LinkedIn, contact form endpoint, project links) are in the `SITE` and `PROJECT_LINKS` objects near the top of the main script in `index.html`. To enable the contact form, set `SITE.formEndpoint` to a Formspree or Web3Forms URL.

## Local preview

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

## Tech

HTML, CSS (prebuilt Tailwind utilities + custom styles), vanilla JavaScript, Inter and JetBrains Mono (Google Fonts), GitHub Pages, Firebase Realtime Database (optional).

## License

© Kamrul Hassan. All rights reserved.
