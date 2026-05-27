# Status Brief（自動產生）

> 這份檔案由 `command-center/scripts/collect-status.sh` 自動產生，**請勿手動編輯**。
> 要改格式請改腳本；要改掃描範圍請改 `command-center/repos.txt`。
> 最後更新：2026-05-27 23:07 UTC

---

## instancemax/ai-collaboration-protocol

**Open PRs:**
- 無

**Open Issues:**
- 無

**Latest commit:** 4690983 chore: update status brief [skip ci] — 2026-05-26

## instancemax/bank

**Open PRs:**
- #98 feat(exchange): Resilience4j circuit breaker for external rate API (@instancemax)
- #96 feat(#95): 分散式鎖 — Redis SETNX 保護並發轉帳 (@instancemax)
- #94 feat(#93): 帳戶凍結/解凍 — admin 可鎖定異常帳戶 (@instancemax)
- #92 refactor(#91): 金融精度 — double → BigDecimal + DECIMAL(19,4) (@instancemax)
- #90 feat(#80): ACH settlement inbound consumer (清算回檔消費者) (@instancemax)
- #58 feat(mobile): configure android build and ignore actions-runner (@instancemax)

**Open Issues:**
- #99 feat: 交易對帳單 CSV 匯出 — GET /api/transactions/export
- #97 feat: Resilience4j circuit breaker for external exchange rate API
- #95 feat(backend): 分散式鎖 — Redis SETNX 保護轉帳並發，防止跨實例 race condition
- #93 feat(backend): 帳戶凍結/解凍 — 管理員可凍結異常帳戶，凍結中帳戶拒絕所有交易
- #91 refactor(backend): 金融精度 — double → BigDecimal + DECIMAL(19,4)
- #80 feat(backend): 清算回檔消費者 — 讀取外部清算結果更新帳戶（吃資料）
- #54 feat(mobile): Flutter app 發布 — Google Play Internal Testing + Apple TestFlight
- #51 bug: ianjiayuanboy.dev/securities 跳轉 404

**Latest commit:** 9e26b87 feat(#81): 信用卡核心子系統 (#89) — 2026-05-27

**Work Log 最新：** ## 2026-05-27 — 霧仔（Sonnet 4.6）→ 交接給雲端帕魯

