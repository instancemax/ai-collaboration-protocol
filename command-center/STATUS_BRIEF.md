# Status Brief（自動產生）

> 這份檔案由 `command-center/scripts/collect-status.sh` 自動產生，**請勿手動編輯**。
> 要改格式請改腳本；要改掃描範圍請改 `command-center/repos.txt`。
> 最後更新：2026-05-26 22:59 UTC

---

## instancemax/ai-collaboration-protocol

**Open PRs:**
- 無

**Open Issues:**
- 無

**Latest commit:** 5e5718f chore: update status brief [skip ci] — 2026-05-25

## instancemax/bank

**Open PRs:**
- #89 feat(cards): 信用卡核心子系統 #81 (@instancemax)
- #88 feat: 2FA / TOTP 雙重驗證 (Issue #71) (@instancemax)
- #87 feat: OpenAPI 3.0 / Swagger UI (Issue #73) (@instancemax)
- #86 feat: 外幣換匯功能 (Issue #69) (@instancemax)
- #85 feat(#66): Redis distributed session — 取代 ConcurrentHashMap (@instancemax)
- #84 feat(#65): idempotency key for /api/transfer — 防重複轉帳 (@instancemax)
- #83 feat(#79): ACH settlement file generator — 吐資料系統 (@instancemax)
- #82 feat(#70,#77,#78): banking batch systems — audit log, EOD batch, DAR (@instancemax)
- #76 feat(#68): spending analysis charts on dashboard (@instancemax)
- #60 feat(securities): simulated buy/sell trading + landing page entry (@instancemax)
- #58 feat(mobile): configure android build and ignore actions-runner (@instancemax)

**Open Issues:**
- #81 feat(backend): 信用卡核心子系統 — 授權、帳單週期、循環信用
- #80 feat(backend): 清算回檔消費者 — 讀取外部清算結果更新帳戶（吃資料）
- #79 feat(backend): 清算檔產生器 — ACH 格式轉帳清算檔輸出（吐資料）
- #78 feat(backend): DAR 日活報表 — 每日交易彙整 + Redis 快照
- #77 feat(backend): EOD 日終批次 — 利息計算 + 日結摘要
- #73 feat(backend): OpenAPI 3.0 / Swagger UI — API 自動文件化
- #71 feat(security): 2FA / TOTP — Google Authenticator 雙重驗證
- #70 feat(backend): 不可竄改稽核日誌 — 所有敏感操作留下 append-only 紀錄
- #69 feat(frontend): 外幣換匯 — 用即時匯率在帳戶間買賣 USD
- #68 feat(frontend): 支出分析圖表 — 月度圓餅圖 / 趨勢折線圖
- #66 feat(backend): Redis 分散式 Session — 取代 ConcurrentHashMap
- #65 feat(backend): Idempotency Key for /api/transfer — 防止重複轉帳
- #54 feat(mobile): Flutter app 發布 — Google Play Internal Testing + Apple TestFlight
- #51 bug: ianjiayuanboy.dev/securities 跳轉 404

**Latest commit:** f9d1966 feat(security): Token Bucket 限流 — login/register 每 IP 每分鐘最多 5 次 (#75) — 2026-05-24

**Work Log 最新：** ## 2026-05-23 — 霧仔（Sonnet 4.6）→ 交接給雲端帕魯

