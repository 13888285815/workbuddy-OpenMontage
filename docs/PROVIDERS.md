# OpenMontage 服务提供商指南

关于 OpenMontage 中每个提供商的完整信息 —— 设置说明、定价、免费层，以及每个提供商解锁的功能。

---

## 快速开始：我应该设置什么？

**从免费开始，按需添加付费提供商。** 推荐顺序如下：

| 步骤 | 成本 | 设置内容 | 解锁功能 |
|------|------|----------|----------|
| 1 | **$0** | Pexels + Pixabay | 素材照片和视频 —— 足以制作基础视频 |
| 2 | **$0** | Google API 密钥 | TTS，700+ 语音（每月100万字符免费）+ $300 新账户积分 |
| 3 | **$0** | ElevenLabs | 高级 TTS + 音乐 + 音效（每月10K字符免费） |
| 4 | **$0** | Piper（本地安装） | 完全离线 TTS —— 无需 API 密钥、无成本、无网络 |
| 5 | **~$0.03/图** | fal.ai | FLUX 图片 + Kling/Veo/MiniMax 视频 + Recraft —— 广泛单密钥图片+视频覆盖 |
| 6 | **~$0.04/图** | OpenAI | DALL-E 3 图片 + OpenAI TTS |
| 7 | **~$0.04/图** | Google Imagen | Imagen 4 图片（共享 Google API 密钥） |
| 8 | **$12/月** | Runway | Gen-4 视频 —— 最高质量 AI 视频 |
| 9 | **按量付费** | HeyGen | 虚拟形象视频、多模型视频网关 |
| 10 | **按量付费** | Suno | 含人声和歌词的完整歌曲生成 |
| 11 | **$0 + GPU** | 本地视频生成 | WAN 2.1、Hunyuan、CogVideo、LTX —— 免费、离线 |
| 12 | **$0 + GPU** | 本地 Diffusion | Stable Diffusion 图片 —— 免费、离线 |

### 环境变量摘要

```bash
# .env —— 在这里添加你的密钥

# 免费（永不收费）
PEXELS_API_KEY=              # 素材照片 + 视频
PIXABAY_API_KEY=             # 素材照片 + 视频

# GOOGLE（一个密钥，两个工具，慷慨的免费层）
GOOGLE_API_KEY=              # Google TTS + Google Imagen

# 语音 + 音乐
ELEVENLABS_API_KEY=          # TTS、音乐、音效（每月10K字符免费）
OPENAI_API_KEY=              # OpenAI TTS + DALL-E 3 图片
XAI_API_KEY=                 # xAI Grok 图片生成/编辑 + Grok 视频生成

# 多模型网关（一个密钥，6+ 工具）
FAL_KEY=                     # FLUX、Recraft、Kling、Veo、MiniMax 视频

# 视频
HEYGEN_API_KEY=              # HeyGen 虚拟形象视频网关
RUNWAY_API_KEY=              # Runway Gen-4 视频（直接）
SUNO_API_KEY=                # Suno 音乐生成

# 本地（无需密钥 —— 只需 GPU + 安装）
VIDEO_GEN_LOCAL_ENABLED=     # 设为 "true" 以启用本地视频生成
VIDEO_GEN_LOCAL_MODEL=       # wan2.1-1.3b、wan2.1-14b、hunyuan-1.5、ltx2-local、cogvideo-5b
```

---

## 云提供商

### xAI —— Grok 图片 + 视频

> **如果你想要一个用于图片编辑和参考条件短视频的提供商，这是最佳选择。** Grok 可以在一个密钥下同时覆盖图片生成/编辑和视频生成。

**解锁的工具：** `grok_image`, `grok_video`
**环境变量：** `XAI_API_KEY`

#### 设置

1. 创建一个 xAI 开发者账户
2. 在 xAI 开发者控制台生成 API 密钥
3. 添加到 `.env`：`XAI_API_KEY=xai-...`

#### 最适合

- 图片编辑和风格迁移
- 多图合成为一张生成帧
- 人物、服装或产品必须延续到动态中的短参考图像视频

#### 定价

当前 Grok 媒体模型的 xAI 文档定价：

| 模型 | 价格 |
|------|------|
| `grok-imagine-image` | 每个生成的图片 $0.02 |
| `grok-imagine-image` 输入图片（编辑/合成） | 每个输入图片 $0.002 |
| `grok-imagine-video` 480p | 每秒 $0.05 |
| `grok-imagine-video` 720p | 每秒 $0.07 |
| `grok-imagine-video` 输入图片 | 每个输入图片 $0.002 |

OpenMontage 现在在 Grok 工具估算器中使用这些公布的价格。

---

### fal.ai —— 多模型网关

> **广泛的单密钥覆盖。** 一个 API 密钥解锁跨多个模型的图片和视频提供商。

**解锁的工具：** `flux_image`, `recraft_image`, `kling_video`, `veo_video`, `minimax_video`
**环境变量：** `FAL_KEY`

#### 设置

1. 前往 [fal.ai](https://fal.ai/)，点击 **Sign up**（GitHub 或 Google）
2. 前往 [fal.ai/dashboard/keys](https://fal.ai/dashboard/keys)
3. 点击 **Create Key**，复制它
4. 添加到 `.env`：`FAL_KEY=your-key-here`

#### 定价

无订阅 —— 纯按量付费，无最低消费。

**图片生成：**

| 模型 | 价格 | 每 $1 |
|------|------|-------|
| FLUX Pro v1.1 | $0.05/图 | 20 图 |
| FLUX Dev | $0.03/图 | 33 图 |
| Recraft v3 | ~$0.04/图 | 25 图 |

**视频生成：**

| 模型 | 价格 | 每 $1 |
|------|------|-------|
| Kling 2.5 Turbo Pro | $0.07/秒 | 14 秒 |
| MiniMax | ~$0.05/秒 | 20 秒 |
| Veo 3 | $0.40/秒 | 2.5 秒 |
| WAN 2.5 | $0.05/秒 | 20 秒 |

**免费层：** 无 —— 但 $0 开始，只需为你使用的内容付费。

---

### ElevenLabs —— 语音、音乐、音效

> **高级语音质量。** 配音密集型视频的最佳 TTS。也生成音乐和音效。

**解锁的工具：** `elevenlabs_tts`, `music_gen`
**环境变量：** `ELEVENLABS_API_KEY`

#### 设置

1. 前往 [elevenlabs.io](https://elevenlabs.io)，点击 **Sign up**
2. 前往 **Profile**（左下角）> **API Keys**，或访问 [elevenlabs.io/app/settings/api-keys](https://elevenlabs.io/app/settings/api-keys)
3. 点击 **Create API Key**，命名它，复制它
4. 添加到 `.env`：`ELEVENLABS_API_KEY=xi_your-key-here`

#### 定价

| 计划 | 价格 | 字符/月 | 主要功能 |
|------|------|---------|----------|
| **免费** | $0 | 10,000 | 3 个自定义语音、API 访问、需要归属 |
| Starter | $5/月 | 30,000 | 无需归属 |
| Creator | $22/月 | 100,000 | 专业语音克隆 |
| Pro | $99/月 | 500,000 | 96kbps 音频、使用分析 |
| Scale | $330/月 | 2,000,000 | 优先支持 |

**免费层：** 每月 10,000 字符（大约 2-3 分钟配音）。包含 API 访问。免费层也可使用音乐生成和音效，有有限积分。

---

### Google —— TTS + Imagen（共享密钥）

> **一个密钥，两个工具。** Google Cloud TTS 有 700+ 语音，支持 50+ 语言 —— 最强的本地化选项。Imagen 4 生成高质量图片。

**解锁的工具：** `google_tts`, `google_imagen`
**环境变量：** `GOOGLE_API_KEY`

#### 设置

1. 前往 [Google AI Studio](https://aistudio.google.com/)，登录
2. 前往 [aistudio.google.com/apikey](https://aistudio.google.com/apikey)
3. 点击 **Create API Key**，选择 Google Cloud 项目
4. 复制密钥
5. 添加到 `.env`：`GOOGLE_API_KEY=AIza...`

**关于 TTS，** 还需要启用 Text-to-Speech API：
1. 访问 [console.cloud.google.com/apis/library/texttospeech.googleapis.com](https://console.cloud.google.com/apis/library/texttospeech.googleapis.com)
2. 点击 **Enable**
3. 确保你的 API 密钥限制允许 Text-to-Speech API

**关于 Imagen，** 启用 Generative Language API：
1. 访问 [console.cloud.google.com/apis/library/generativelanguage.googleapis.com](https://console.cloud.google.com/apis/library/generativelanguage.googleapis.com)
2. 点击 **Enable**

#### Google TTS 定价

| 语音类型 | 免费层 | 付费（每100万字符） | 说明 |
|----------|--------|---------------------|------|
| **Standard** | 每月100万字符 | $4.00 | 基础质量，快速 |
| **WaveNet** | 每月100万字符 | $16.00 | 自然发音 |
| **Neural2** | 每月100万字符 | $16.00 | 最佳质量 |
| **Studio** | — | $24.00 | 专业录音棚语音 |
| **Chirp** | — | $4.00 | 对话风格 |

免费层**独立适用** —— 你每月免费获得 100万 Standard AND 100万 WaveNet AND 100万 Neural2 字符。那大约每月 250+ 分钟免费配音。

#### Google Imagen 定价

| 模型 | 每张图片价格 |
|------|-------------|
| Imagen 4 Fast | $0.02 |
| Imagen 4 Standard | $0.04 |
| Imagen 4 Ultra | $0.06 |

**Imagen 免费层：** 无。仅为付费层。

**新账户奖励：** Google Cloud 为新账户提供 **$300 免费积分**（90天试用），适用于 TTS 和 Imagen。

#### Google TTS 语音类型

Google TTS 提供 700+ 语音，覆盖 50+ 语言。语音名称遵循 `{语言}-{类型}-{字母}` 模式：

| 类型 | 示例 | 质量 | 成本 |
|------|------|------|------|
| **Chirp 3 HD** | `en-US-Chirp3-HD-Orus` | **最佳（2024，最自然）** | **中 —— 默认** |
| Standard | `en-US-Standard-A` | 良好 | 最便宜 |
| WaveNet | `en-US-WaveNet-D` | 很好 | 中 |
| Neural2 | `en-US-Neural2-D` | 卓越 | 中 |
| Studio | `en-US-Studio-O` | 专业 | 最高 |
| Journey | `en-US-Journey-D` | 对话式（长篇） | 中 |

**推荐语音：** `en-US-Chirp3-HD-Orus`（男声，浑厚/电影感）、`en-US-Chirp3-HD-Aoede`（女声，温暖）。这些是 Google 最新层级 —— 最自然发音，自动使用 v1beta1 端点。

**语言包括：** 英语（美国、英国、澳大利亚、印度）、西班牙语、法语、德语、意大利语、葡萄牙语、日语、韩语、中文（普通话、粤语）、阿拉伯语、印地语、俄语、荷兰语、波兰语、土耳其语、越南语、泰语、印度尼西亚语等 30+ 种。

---

### OpenAI —— TTS + 图片生成

> **扎实的全能选手。** DALL-E 3 很好地处理复杂多元素构图。TTS 快速且经济实惠。

**解锁的工具：** `openai_tts`, `openai_image`
**环境变量：** `OPENAI_API_KEY`

#### 设置

1. 前往 [platform.openai.com/signup](https://platform.openai.com/signup) 创建账户
2. 在 [platform.openai.com/account/billing](https://platform.openai.com/account/billing) 添加支付方式
3. 前往 [platform.openai.com/api-keys](https://platform.openai.com/api-keys)
4. 点击 **Create new secret key**，命名它，复制它
5. 添加到 `.env`：`OPENAI_API_KEY=sk-...`

#### TTS 定价

| 模型 | 每100万字符价格 |
|------|----------------|
| tts-1 | $15.00 |
| tts-1-hd | $30.00 |
| gpt-4o-mini-tts | $12.00 |

#### 图片定价

| 模型 | 尺寸 | 质量 | 每张图片价格 |
|------|------|------|-------------|
| DALL-E 3 | 1024x1024 | standard | $0.040 |
| DALL-E 3 | 1024x1024 | hd | $0.080 |
| DALL-E 3 | 1024x1792 | standard | $0.080 |
| DALL-E 3 | 1024x1792 | hd | $0.120 |

**免费层：** 无。需要预付账单。大多数注册不再提供 $5 免费积分。

---

### Runway —— Gen-3/Gen-4 视频

> **最高评分的 AI 视频质量。** Elo 排名第一。Gen-3 Alpha Turbo、Gen-4 Turbo 和 Gen-4 Aleph 模型的专业级视频生成。

**解锁的工具：** `runway_video`
**环境变量：** `RUNWAY_API_KEY`

#### 设置

1. 前往 [dev.runwayml.com](https://dev.runwayml.com/) 创建开发者账户
2. 订阅付费计划（Standard 或以上 —— API 需要订阅）
3. 从开发者门户生成 API 密钥
4. 添加到 `.env`：`RUNWAY_API_KEY=key_...`

#### 定价

| 计划 | 价格 | 积分/月 | 视频容量 |
|------|------|---------|----------|
| **免费** | $0 | 125（一次性） | 约 5 秒 Gen-4 |
| Standard | $12/月 | 625 | 约 25 秒 Gen-4 |
| Pro | $28/月 | 2,250 | 约 90 秒 Gen-4 |
| Unlimited | $76/月 | 无限（探索模式） | 无限 Gen-4 Turbo |

**API 定价（近似）：**

| 模型 | 每秒价格 |
|------|----------|
| Gen-3 Alpha Turbo | ~$0.05 |
| Gen-4 Turbo | ~$0.05 |
| Gen-4 Aleph | ~$0.15 |

**免费层：** 125 一次性积分（不按月续期）。足够约 5 秒 Gen-4 视频。API 访问需要付费订阅。

---

### Higgsfield —— 多模型视频编排器

> **多模型视频平台。** 通过单一 API 路由到 Kling 3.0、Veo 3.1、Sora 2、 WAN 2.5 和专有 Soul Cinema。包括 Soul ID 以跨剪辑保持角色一致性。

**解锁的工具：** `higgsfield_video`
**环境变量：** `HIGGSFIELD_API_KEY` + `HIGGSFIELD_API_SECRET`（或组合 `HIGGSFIELD_KEY=key:secret`）

#### 设置

1. 前往 [cloud.higgsfield.ai](https://cloud.higgsfield.ai/) 创建账户
2. 订阅计划（Starter 或以上以获得 API 访问）
3. 前往 API Keys 部分 [cloud.higgsfield.ai/api-keys](https://cloud.higgsfield.ai/api-keys)
4. 生成 API 密钥和密钥
5. 添加到 `.env`：
   ```
   HIGGSFIELD_API_KEY=your-api-key
   HIGGSFIELD_API_SECRET=your-api-secret
   ```

#### 定价

| 计划 | 价格 | 说明 |
|------|------|------|
| Free | $0 | 有限积分 |
| Starter | $15/月 | 基础分配 |
| Plus | $34/月 | 中档，约 33-56 个 Kling 3.0 剪辑 |
| Ultra | $84/月 | 高容量 |

**每次生成成本（近似，通过积分）：**

| 模型 | 每剪辑成本 |
|------|-----------|
| Kling 3.0 | ~$0.10（最便宜） |
| WAN 2.5 | ~$0.10 |
| Soul Cinema | ~$0.15 |
| Veo 3.1 | ~$0.50 |
| Sora 2 | ~$0.50 |

**免费层：** 注册时有限积分。免费计划不按月续期。

---

### HeyGen —— 虚拟形象视频网关

> **多模型视频网关。** 通过单一 API 访问 VEO、Sora、Runway、Kling 和 Seedance。

**解锁的工具：** `heygen_video`
**环境变量：** `HEYGEN_API_KEY`

#### 设置

1. 前往 [app.heygen.com/register](https://app.heygen.com/register) 创建账户
2. 在设置中导航到 API 部分
3. 生成你的 API 密钥
4. 添加 API 余额（预付，独立于网络计划积分）
5. 添加到 `.env`：`HEYGEN_API_KEY=your-key-here`

#### 定价

| 服务 | 价格 |
|------|------|
| 虚拟形象视频（Engine III） | $0.017/秒 |
| 虚拟形象视频（Engine IV） | $0.10/秒 |
| Prompt to Video | $0.033/秒 |
| 视频翻译（快速） | $0.05/秒 |
| 视频翻译（精确） | $0.10/秒 |

**网络计划：**

| 计划 | 价格 | 说明 |
|------|------|------|
| Free | $0 | 1 积分（演示） |
| Creator | $24/月 | 有限积分 |
| Business | $72/月 | API 访问，更多积分 |

**免费层：** 网络平台 1 积分。API 是按量预付余额。

---

### Suno —— AI 音乐生成

> **带人声和歌词的完整歌曲。** 任何风格，最长 8 分钟。配乐或人声音轨。

**解锁的工具：** `suno_music`
**环境变量：** `SUNO_API_KEY`

#### 设置

1. 前往 [suno.com](https://suno.com) 创建 Suno 账户
2. 有关 API 访问，前往 [sunoapi.org](https://sunoapi.org) 创建账户
3. 前往仪表板并复制你的 API 密钥
4. 添加积分（1 积分 = $0.005 USD）
5. 添加到 `.env`：`SUNO_API_KEY=your-key-here`

#### 定价

**Suno 平台：**

| 计划 | 价格 | 积分 | 说明 |
|------|------|------|------|
| Free | $0 | 50/天 | 约 10 首歌/天，仅限非商业 |
| Pro | $10/月 | 2,500/月 | 商业许可 |
| Premier | $30/月 | 10,000/月 | 商业许可 |

**API（通过 sunoapi.org）：** 按量付费，1 积分 = $0.005。每次生成产生 2 首曲目。

---

### Pexels —— 免费素材媒体

> **完全免费。** 无成本、无需归属、允许商业使用。

**解锁的工具：** `pexels_image`, `pexels_video`
**环境变量：** `PEXELS_API_KEY`

#### 设置

1. 前往 [pexels.com/join](https://www.pexels.com/join/)，创建免费账户
2. 前往 [pexels.com/api](https://www.pexels.com/api/)
3. 点击 **Your API Key** 或请求 API 访问
4. 从仪表板复制你的密钥
5. 添加到 `.env`：`PEXELS_API_KEY=your-key-here`

#### 定价

**完全免费。** 无付费层。无需归属。允许商业使用。

- 200 请求/小时
- 20,000 请求/月
- 照片和视频搜索 + 下载

---

### Pixabay —— 免费素材媒体

> **完全免费。** 500万+ 免版税图片和视频。

**解锁的工具：** `pixabay_image`, `pixabay_video`
**环境变量：** `PIXABAY_API_KEY`

#### 设置

1. 前往 [pixabay.com/accounts/register](https://pixabay.com/accounts/register/)，创建免费账户
2. 前往 [pixabay.com/api/docs](https://pixabay.com/api/docs/)
3. 登录后你的 API 密钥显示在文档页面顶部
4. 复制密钥
5. 添加到 `.env`：`PIXABAY_API_KEY=your-key-here`

#### 定价

**完全免费。** 无付费层。无需归属。允许商业使用。

- 约 100 请求/分钟
- 5,000 请求/小时
- 照片和视频搜索 + 下载
- 标准 API 限于 1280px 图片（完整分辨率需要编辑 API）

---

## 本地提供商（免费，无需 API 密钥）

这些提供商完全在你的机器上运行。无网络、无 API 密钥、无成本。部分需要 GPU。

### Remotion —— 程序化视频合成

> **基于 React 的视频渲染。** 将静态图片转化为带弹簧物理、动画文本卡片、统计卡片、图表和过渡的动画视频。**当没有配置视频生成提供商时，这是关键回退** —— 智能体生成图片，Remotion 将它们动画化为专业外观的视频。

**工具：** `video_compose`（使用 `operation="render"` —— 需要时自动路由到 Remotion）
**运行时：** CPU（需要 Node.js）
**环境变量：** 无

#### 设置

```bash
# 包含在 make setup 中，或手动安装：
cd remotion-composer && npm install && cd ..
```

需要 **Node.js 18+** 和 `npx`。`remotion-composer/` 项目包含在仓库中。

#### Remotion 渲染内容

| 组件 | 产出 |
|------|------|
| **TextCard** | 带弹簧物理入场的动画标题/正文文本 |
| **StatCard** | 带计数动画的动画统计 |
| **ProgressBar** | 动画进度指示器 |
| **CalloutBox** | 带图标动画的高亮标注面板 |
| **ComparisonCard** | 并排比较布局 |
| **BarChart / LineChart / PieChart** | 动画数据可视化 |
| **KPIGrid** | 多指标仪表板卡片 |
| **Image scenes** | 带弹簧动画运动（替代 Ken Burns）的静态图片 |

#### Remotion 何时激活？

`video_compose` 工具的 `render` 操作自动检测何时需要 Remotion：
- 剪辑包含静态图片（`.png`、`.jpg` 等）
- 剪辑有设置为 `text_card`、`stat_card`、`chart` 等的 `type`
- 剪辑指定 `animation` 或 `transition_in`/`transition_out`

如果未安装 Remotion，合成回退到 FFmpeg Ken Burns 平移和缩放 —— 功能性但吸引力较低。

**成本：** 免费。始终本地。

---

### Piper TTS —— 离线文字转语音

> **完全免费、完全离线 TTS。** 无需网络。适合草稿和预算受限项目。

**工具：** `piper_tts`
**运行时：** CPU（无需 GPU）
**环境变量：** 无

#### 设置

```bash
# 通过 pip 安装
pip install piper-tts

# 或从 GitHub 下载二进制文件：
# https://github.com/rhasspy/piper/releases

# 下载语音模型（首次运行自动下载）
piper --download-dir ~/.piper/models --model en_US-lessac-medium
```

**可用语音：** 约 30 个英语语音，加上德语、法语、西班牙语、意大利语和其他语言的语音。比云提供商选择少，但完全免费和离线。

**质量：** 适合草稿、内部视频和预算项目。对于面向客户的配音，使用 ElevenLabs 或 Google TTS。

---

### 本地视频生成（需要 GPU）

> **免费 AI 视频生成。** 需要 NVIDIA GPU，VRAM 充足。

**工具：** `wan_video`, `hunyuan_video`, `cogvideo_video`, `ltx_video_local`
**运行时：** 本地 GPU（需要 CUDA）
**环境变量：** `VIDEO_GEN_LOCAL_ENABLED=true`，`VIDEO_GEN_LOCAL_MODEL=<model>`

#### 设置

```bash
# 1. 安装 GPU 堆栈
make install-gpu
# 或手动：
pip install diffusers transformers accelerate torch pillow requests

# 2. 在 .env 中启用本地生成
VIDEO_GEN_LOCAL_ENABLED=true

# 3. 根据你的 GPU VRAM 选择模型
VIDEO_GEN_LOCAL_MODEL=wan2.1-1.3b      # 6GB+ VRAM（入门级）
VIDEO_GEN_LOCAL_MODEL=wan2.1-14b       # 24GB+ VRAM（最佳本地质量）
VIDEO_GEN_LOCAL_MODEL=hunyuan-1.5      # 12GB+ VRAM
VIDEO_GEN_LOCAL_MODEL=ltx2-local       # 8GB+ VRAM（最快）
VIDEO_GEN_LOCAL_MODEL=cogvideo-5b      # 10GB+ VRAM
VIDEO_GEN_LOCAL_MODEL=cogvideo-2b      # 6GB+ VRAM（最轻）
```

#### 模型对比

| 模型 | VRAM | 质量 | 速度 | 最适合 |
|------|------|------|------|--------|
| **WAN 2.1 (1.3B)** | 6GB | 良好 | 快速 | 入门级 GPU、快速迭代 |
| **WAN 2.1 (14B)** | 24GB | 卓越 | 慢 | 最佳质量-VRAM 比 |
| **Hunyuan 1.5** | 12GB | 很好 | 中等 | 中端 GPU |
| **LTX-2** | 8GB | 良好 | 最快 | 快速草稿、最低延迟 |
| **CogVideo (5B)** | 10GB | 良好 | 中等 | 平衡选项 |
| **CogVideo (2B)** | 6GB | 一般 | 快速 | 低 VRAM 实验 |

**所有本地模型支持：** 图生视频、文字生视频、离线生成、种子可重现性。

---

### 本地 Diffusion —— 离线图片生成（需要 GPU）

> **免费 Stable Diffusion 图片生成。** 无 API 成本，完全离线。

**工具：** `local_diffusion`
**运行时：** 本地 GPU（需要 CUDA）
**环境变量：** 无（通过安装依赖启用）

#### 设置

```bash
pip install diffusers transformers accelerate torch
```

首次运行下载模型（约 4GB）。后续运行使用缓存模型。

**VRAM 要求：** 4GB+（推荐 8GB 用于 1024x1024 图片）

**支持：** 负提示词、种子、自定义尺寸。质量低于 FLUX 或 DALL-E 3，但完全免费和离线。

---

### Modal 上的 LTX-2 —— 自托管云 GPU

> **在 Modal 的云 GPU 上运行 LTX-2。** 你自己的端点，你自己的规模。比本地 GPU 更一致，比商业 API 更便宜。

**工具：** `ltx_video_modal`
**运行时：** 云（自托管）
**环境变量：** `MODAL_LTX2_ENDPOINT_URL`

#### 设置

1. 创建一个 [Modal](https://modal.com) 账户
2. 部署 LTX-2 端点（参见 Modal 文档）
3. 在 `.env` 中设置端点 URL：`MODAL_LTX2_ENDPOINT_URL=https://your-modal-endpoint`

**Modal 定价：** A100 GPU 时间约 $0.99/小时。每视频成本取决于生成时间。

---

### 其他本地工具（始终可用）

这些工具只需要 FFmpeg 或 Python 包 —— 无 GPU、无 API 密钥。

| 工具 | 安装 | 功能 |
|------|------|------|
| **FFmpeg 工具**（video_compose、video_stitch、video_trimmer、audio_mixer、audio_enhance、color_grade、face_enhance、frame_sampler、scene_detect） | `brew install ffmpeg` / `sudo apt install ffmpeg` / `winget install FFmpeg` | 视频编辑、音频处理、色彩校正、分析 |
| **Transcriber** | `pip install faster-whisper` | 带逐词时间戳的语音转文字 |
| **Background Remove** | `pip install rembg`（CPU）或 `pip install rembg[gpu]` | 去除图片/视频背景 |
| **Upscale** | `pip install realesrgan`（需要 PyTorch + CUDA） | Real-ESRGAN 图片/视频放大 |
| **Face Restore** | `pip install gfpgan`（需要 PyTorch） | CodeFormer/GFPGAN 面部修复 |
| **Code Snippet** | `pip install Pygments Pillow` | 语法高亮代码图片 |
| **Diagram Gen** | `npm install -g @mermaid-js/mermaid-cli` | Mermaid 图表渲染 |
| **Math Animate** | `pip install manim` | ManimCE 数学动画 |
| **Subtitle Gen** | 无需安装 | SRT/VTT 字幕文件生成 |
| **Video Understand** | `pip install transformers torch` | CLIP/BLIP-2 视觉分析 |
| **Talking Head** | 克隆 [SadTalker](https://github.com/OpenTalker/SadTalker) | 从照片 + 音频的虚拟形象动画 |
| **Lip Sync** | 克隆 [Wav2Lip](https://github.com/Rudrabha/Wav2Lip) | 音频驱动的唇形同步 |

---

## 提供商到工具映射

| 提供商 | 环境变量 | 解锁的工具 | 成本 |
|--------|----------|-----------|------|
| **Pexels** | `PEXELS_API_KEY` | `pexels_image`, `pexels_video` | 免费 |
| **Pixabay** | `PIXABAY_API_KEY` | `pixabay_image`, `pixabay_video` | 免费 |
| **Piper** | —（仅安装） | `piper_tts` | 免费 |
| **Google** | `GOOGLE_API_KEY` | `google_tts`, `google_imagen` | 免费层 + 付费 |
| **ElevenLabs** | `ELEVENLABS_API_KEY` | `elevenlabs_tts`, `music_gen` | 免费层 + 付费 |
| **fal.ai** | `FAL_KEY` | `flux_image`, `recraft_image`, `kling_video`, `veo_video`, `minimax_video` | 按量付费 |
| **OpenAI** | `OPENAI_API_KEY` | `openai_tts`, `openai_image` | 仅付费 |
| **xAI** | `XAI_API_KEY` | `grok_image`, `grok_video` | 仅付费 |
| **Runway** | `RUNWAY_API_KEY` | `runway_video` | 免费试用 + 付费 |
| **Higgsfield** | `HIGGSFIELD_API_KEY` + `HIGGSFIELD_API_SECRET` | `higgsfield_video` | 订阅（$15-84/月） |
| **HeyGen** | `HEYGEN_API_KEY` | `heygen_video` | 按量付费 |
| **Suno** | `SUNO_API_KEY` | `suno_music` | 按量付费 |
| **本地 GPU** | `VIDEO_GEN_LOCAL_ENABLED` | `wan_video`, `hunyuan_video`, `cogvideo_video`, `ltx_video_local` | 免费（需要 GPU） |
| **本地 Diffusion** | —（仅安装） | `local_diffusion` | 免费（需要 GPU） |
| **Modal** | `MODAL_LTX2_ENDPOINT_URL` | `ltx_video_modal` | 自托管云 |

---

## 能力覆盖

每个能力覆盖多少提供商：

| 能力 | 云提供商 | 本地提供商 | 免费选项 |
|------|----------|------------|----------|
| **图片生成** | FLUX、Grok、Google Imagen、DALL-E 3、Recraft | 本地 Diffusion | Pexels、Pixabay（素材） |
| **视频生成** | Grok、Kling、Runway、Veo、Higgsfield、MiniMax、HeyGen | WAN、Hunyuan、CogVideo、LTX | Pexels、Pixabay（素材） |
| **文字转语音** | ElevenLabs、Google TTS、OpenAI | Piper | Piper、Google 免费层、ElevenLabs 免费层 |
| **音乐生成** | ElevenLabs、Suno | — | ElevenLabs 免费层 |
| **后期制作** | — | FFmpeg（合成、拼接、修剪、混合、增强、校正） | 全部免费 |
| **分析** | — | WhisperX、场景检测、帧采样、CLIP/BLIP-2 | 全部免费 |
| **增强** | — | 放大、背景去除、面部增强、面部修复 | 全部免费 |
| **虚拟形象** | — | SadTalker、Wav2Lip | 全部免费 |

---

## 常见问题

**问：制作视频的绝对最低要求是什么？**
答：FFmpeg + Node.js（均为免费、本地）。FFmpeg 处理视频组装、音频混合和字幕。有了 Node.js，Remotion 将静态图片渲染为动画视频 —— 所以即使没有任何视频生成 API，智能体也会生成图片，Remotion 将它们转化为带弹簧动画、文本卡片和过渡的专业外观视频。添加 Piper TTS 获得免费配音，Pexels/Pixabay 获得免费素材。

**问：我没有任何视频生成提供商。我还能制作视频吗？**
答：可以。智能体生成静态图片（通过任何图片提供商 —— 甚至 Pexels/Pixabay 的免费素材），Remotion 将它们合成为带弹簧物理过渡、文本卡片、统计卡片和图表的动画视频。当没有配置视频生成时，这是解说和动画流水线的默认路径。

**问：获取 AI 生成图片和视频的低摩擦方式是什么？**
答：fal.ai（`FAL_KEY`）是一个按量付费选项，具有广泛的单密钥覆盖。它解锁 FLUX 图片以及多个视频提供商。无订阅 —— 只为你生成的内容付费。

**问：我有 GPU。我可以在本地免费运行什么？**
答：设置 `VIDEO_GEN_LOCAL_ENABLED=true` 并安装 `diffusers`。你获得 WAN 2.1、Hunyuan、CogVideo 和 LTX 视频生成以及 Stable Diffusion 图片生成 —— 全部免费、全部离线。

**问：我应该使用哪个 TTS 提供商？**
答：质量 → ElevenLabs。本地化（50+ 语言）→ Google TTS。预算 → Google 免费层（每月 100 万字符）。离线 → Piper。

**问：我需要所有这些提供商吗？**
答：不需要。从你拥有的开始。选择器模式自动路由到任何可用的。缺少提供商？系统自动切换到下一个。

---

