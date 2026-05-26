# 个人主页源文件组织与创建指南

> 目标：在当前 `homepage` 项目中，规范存放个人主页的原始素材、结构化内容和可发布文件，并预留隐私信息填写位置。

## 1. 推荐文件夹大纲

```text
homepage/
├─ originals/                         # 原始文件（不直接上线）
│  ├─ profile-photo-raw/              # 原始头像、证件照等
│  ├─ project-materials/              # 项目原稿（PPT、PDF、草图等）
│  ├─ certificates-raw/               # 证书扫描件原图
│  └─ notes-private/                  # 仅本地保留的私人草稿
│
├─ src/                               # 可编辑源码（最终生成主页）
│  ├─ content/
│  │  ├─ profile/                     # 个人资料
│  │  │  ├─ basic-info.md             # 基本信息（模板见下文）
│  │  │  ├─ bio.md                    # 个人简介
│  │  │  └─ contacts.md               # 联系方式（公开版）
│  │  ├─ experience/                  # 教育/工作经历
│  │  ├─ projects/                    # 项目介绍
│  │  ├─ achievements/                # 奖项、证书（展示版）
│  │  └─ blog/                        # 博文草稿（可选）
│  │
│  ├─ assets/
│  │  ├─ images/                      # 压缩后的可发布图片
│  │  ├─ icons/                       # 图标
│  │  └─ docs/                        # 可公开附件（简历PDF等）
│  │
│  ├─ components/                     # 页面组件
│  ├─ pages/                          # 页面入口
│  └─ styles/                         # 样式文件
│
├─ public/                            # 直接对外公开的静态资源
│
├─ templates/                         # 资料模板（简历、项目模板）
│
├─ backups/                           # 手动备份快照（按日期命名）
│  └─ YYYY-MM-DD/
│
└─ PERSONAL_HOMEPAGE_SOURCE_GUIDE.md  # 本指南
```

## 2. 私人信息填写模板（留空）

建议新建并维护文件：`src/content/profile/basic-info.md`

```md
# 基本信息（可按需公开）

- 姓名：翟海
- 英文名：Hai Zhai
- 所在城市：苏州
- 个人邮箱（公开）：3398299269@qq.com or 2209408033@stu.edu.cn
- 个人邮箱（私用）：
- 手机号（私用）：
- 微信号（私用）：
- GitHub：https://github.com/dagadada
- 个人网站域名：haizhai.dev
- 一句话介绍：经常违背概率学而吃瘪之人

## 社交链接
- LinkedIn：
- X / Twitter：
- Bilibili：
- 知乎：

## 主页展示偏好
- 是否展示邮箱（是/否）：是
- 是否展示手机号（是/否）：否
- 是否展示城市（是/否）：是
```

## 3. 创建流程（建议按顺序）

### 第一步：创建目录骨架

在项目根目录执行：

```bash
mkdir -p \
originals/profile-photo-raw \
originals/project-materials \
originals/certificates-raw \
originals/notes-private \
src/content/profile \
src/content/experience \
src/content/projects \
src/content/achievements \
src/content/blog \
src/assets/images \
src/assets/icons \
src/assets/docs \
src/components \
src/pages \
src/styles \
public \
templates \
backups
```

### 第二步：创建基础内容文件

```bash
touch \
src/content/profile/basic-info.md \
src/content/profile/bio.md \
src/content/profile/contacts.md
```

### 第三步：填入私人信息模板

把上面的“私人信息填写模板”复制到 `src/content/profile/basic-info.md`，先只填必要字段，敏感项可空着。

### 第四步：区分“原始文件”和“公开文件”

- `originals/`：只放原始资料，不直接发布。
- `src/assets/` 或 `public/`：仅放确认可公开的素材。

### 第五步：建立备份习惯

每次大改前执行一次手动备份，例如：

```bash
mkdir -p backups/$(date +%F)
cp -r src originals templates backups/$(date +%F)/
```

## 4. 使用建议（避免隐私泄露）

- 将“私用联系方式”仅保存在 `originals/` 或本地私有文件中，不进入公开页面。
- 对头像、证件、证书原图先脱敏再放到 `src/assets/`。
- 若你后续使用 Git 托管仓库，建议再补一个 `.gitignore`，排除 `originals/notes-private` 和临时备份文件。
