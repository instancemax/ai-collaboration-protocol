# Status Brief（自動產生）

> 這份檔案由 `command-center/scripts/collect-status.sh` 自動產生，**請勿手動編輯**。
> 要改格式請改腳本；要改掃描範圍請改 `command-center/repos.txt`。
> 最後更新：2026-07-07 22:49 UTC

---

## instancemax/ai-collaboration-protocol

**Open PRs:**
- 無

**Open Issues:**
- 無

**Latest commit:** 5164e5d chore: update status brief [skip ci] — 2026-07-06

## instancemax/bank

**Open PRs:**
- #210 feat(landing): 重構為兩區 — 作品(模擬銀行) / 作者(關於我+App) (@instancemax)
- #58 feat(mobile): configure android build and ignore actions-runner (@instancemax)

**Open Issues:**
- #223 🔴 [infra] site-gate 部署後 cloudflared 連不到 gate-proxy → 502（隧道連線）
- #221 [selfhost] 自架郵件伺服器（⚠️ 高難度 / 高風險，先評估）
- #220 [selfhost] n8n — 自架自動化工作流引擎
- #218 [enhancement] 充實遊樂場（playground）內容
- #217 [enhancement] landing 標示網銀 / 證券為「模擬用途」
- #216 [infra] SEO 基礎建設 — 讓 Google 能收錄首頁
- #215 [feature] 網站橫向擴展 — 讓內容更豐富
- #212 [perf] 轉帳收款方熱點行 (hot row) — 高併發下的競爭
- #211 [hardening] 註冊流程不洩漏「帳號已存在」
- #209 🔴 [security] 網站強制 HTTPS — 解除 Google Safe Browsing 詐騙標記
- #204 🏅 [automation] Telegram Bot — 系統通知 / CI / 每日報表推播
- #203 🏅 [infra] Wireguard VPN — 私有網路 + staging IP 白名單
- #202 🥉 [selfhost] 自架實用服務（Vaultwarden / Memos / AdGuard Home）
- #201 🥈 [ci] 自架 GitHub Actions Runner
- #200 🥈 [ops] Uptime Kuma — 網站可用性監控 + Telegram 告警
- #199 🥇 [infra] Staging 環境 — staging.ianjiayuanboy.dev 上線前測試
- #198 🔴 [security] 正式機跑在 dev profile — 後門帳號/Swagger/CORS 全沒鎖
- #80 feat(backend): 清算回檔消費者 — 讀取外部清算結果更新帳戶（吃資料）
- #54 feat(mobile): Flutter app 發布 — Google Play Internal Testing + Apple TestFlight
- #51 bug: ianjiayuanboy.dev/securities 跳轉 404

**Latest commit:** 4ec02b0 fix(site-gate): 修 /bank 500 真兇 — auth_request 補 Host 標頭 (#222) — 2026-07-07

**Work Log 最新：** ## 2026-07-06 — 寶寶（Opus 4.8）：修 site-gate `/bank` 500（auth_request Content-Length）

