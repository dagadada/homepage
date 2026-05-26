# 个人主页上线清单（GitHub Pages + 自定义域名）

本文基于当前项目配置：
- 自定义域名：`haizhai.dev`
- 已准备文件：`index.html`、`styles.css`、`CNAME`、`.nojekyll`

## 0. 已经帮你做好的内容

- 主页静态文件已可直接发布。
- `CNAME` 已写入 `haizhai.dev`。
- 你可以先不买域名，直接用 `github.io` 测试可访问性。

## 1. 仍需你手动完成的步骤（必须）

这些步骤涉及你的账号权限，我无法替你在外部平台点击：

1. 在 GitHub 创建仓库（建议公开仓库）。
2. 把本地代码推到该仓库。
3. 在仓库 `Settings -> Pages` 中启用发布源（`main` 分支根目录）。
4. 在域名注册商控制台添加 DNS 记录。
5. 回到 GitHub Pages 打开 HTTPS。

## 2. 推送代码命令（首次）

把 `<your-repo-url>` 改成你实际仓库地址：

```bash
git init -b main
git add .
git commit -m "init: personal homepage"
git remote add origin <your-repo-url>
git push -u origin main
```

示例仓库地址：
- SSH：`git@github.com:dagadada/homepage.git`
- HTTPS：`https://github.com/dagadada/homepage.git`

## 3. DNS 记录配置（绑定 `haizhai.dev`）

在域名注册商 DNS 面板添加：

1. `A` 记录，主机 `@`，值 `185.199.108.153`
2. `A` 记录，主机 `@`，值 `185.199.109.153`
3. `A` 记录，主机 `@`，值 `185.199.110.153`
4. `A` 记录，主机 `@`，值 `185.199.111.153`
5. `CNAME` 记录，主机 `www`，值 `<你的GitHub用户名>.github.io`

然后在仓库 `Settings -> Pages -> Custom domain` 填：`haizhai.dev`。

## 4. 是否已生效的检查

本地执行：

```bash
dig +short haizhai.dev A
dig +short www.haizhai.dev CNAME
```

预期：
- `haizhai.dev` 返回上面 4 个 IP（顺序可不同）。
- `www.haizhai.dev` 返回 `<username>.github.io`。

## 5. 收费点说明（你最关心）

## 必付

1. 域名注册费（`haizhai.dev`）
- 按年收费，首年价和续费价通常不同。
- 价格会因注册商和促销变化，结算页为准。

## 可能收费

1. 隐私保护或增值服务
- 有些注册商包含在套餐里，有些单独收费。

2. 私有仓库 Pages 场景
- 如果你坚持用私有仓库发布，可能需要付费 GitHub 计划。
- 公开仓库 + GitHub Pages 通常可免费发布静态站。

## 通常免费

1. GitHub Pages 静态托管（公开仓库）
2. 基础 DNS 解析服务（大多数注册商或 Cloudflare 提供）

## 6. 你可以先零成本上线的路径

如果暂时不买域名：
1. 先发布到 `https://<username>.github.io/<repo>/`。
2. 网站确认没问题后再购买域名并绑定。

## 7. 参考文档

- GitHub Pages 入门：https://docs.github.com/github/working-with-github-pages/getting-started-with-github-pages
- GitHub Pages 自定义域名：https://docs.github.com/articles/setting-up-a-custom-domain?platform=windows
- 域名验证（防止域名劫持）：https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/verifying-your-custom-domain-for-github-pages?apiVersion=2022-11-28
- IANA RDAP Bootstrap（查 TLD 的 RDAP 服务）：https://www.iana.org/assignments/rdap-dns/rdap-dns.xhtml
