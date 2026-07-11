# 姆巴佩，我们对得起你

一个可部署到 GitHub Pages 的静态反讽宣言站。页面可公开访问，配置 Supabase 后，匿名宣言会写入云端并同步显示。

## 已包含

- `index.html`：网站页面
- `styles.css`：视觉样式
- `app.js`：宣言提交、读取和渲染逻辑
- `config.js`：Supabase 连接配置
- `supabase.sql`：Supabase 建表和公开读写策略
- `assets/official-statement-hero.svg`：首屏横幅图

## Supabase 设置

1. 打开 Supabase 项目。
2. 进入 SQL Editor。
3. 复制并执行 `supabase.sql`。
4. 在 Project Settings → API 找到 Project URL 和 anon public key。
5. 把它们填进 `config.js`。

`anon public key` 可以放在前端。不要把 service role key 放进网页。

## GitHub Pages

在仓库 Settings → Pages：

- Source 选择 `Deploy from a branch`
- Branch 选择 `main`
- Folder 选择 `/root`

保存后等待一两分钟，公开网址通常是：

`https://glimmer-boop.github.io/mbappe-rights-site/`

## 内容管理

匿名宣言发布后会立即显示。需要隐藏不合适内容时，在 Supabase 的 `declarations` 表里把对应行的 `is_hidden` 改成 `true`。
