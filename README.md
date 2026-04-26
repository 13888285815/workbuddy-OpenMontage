# OpenMontage

<p align="center">
  <img src="assets/logo.png" alt="OpenMontage" width="200">
</p>

<h1 align="center">OpenMontage</h1>

<p align="center"><strong>首个开源的智能视频制作系统。</strong></p>

<p align="center">
  <a href="#start-from-a-video-you-already-love">粘贴视频</a> &nbsp;·&nbsp;
  <a href="#快速开始">快速开始</a> &nbsp;·&nbsp;
  <a href="#尝试这些提示词">尝试这些提示词</a> &nbsp;·&nbsp;
  <a href="#流水线">流水线</a> &nbsp;·&nbsp;
  <a href="#工作原理">工作原理</a> &nbsp;·&nbsp;
  <a href="docs/PROVIDERS.md">服务提供商</a> &nbsp;·&nbsp;
  <a href="AGENT_GUIDE.md">智能体指南</a>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-AGPLv3-blue.svg" alt="License"></a>
</p>

<p align="center"><strong>关注开发进展</strong></p>

<p align="center">
  <a href="https://www.youtube.com/@OpenMontage"><img src="https://img.shields.io/badge/YouTube-%40OpenMontage-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube"></a>
  <a href="https://x.com/calesthioailabs"><img src="https://img.shields.io/badge/X-%40calesthioailabs-111111?style=for-the-badge&logo=x&logoColor=white" alt="X"></a>
  <a href="https://github.com/calesthio/OpenMontage/discussions"><img src="https://img.shields.io/badge/Community-GitHub%20Discussions-0b1220?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Discussions"></a>
</p>

---

将你的 AI 编程助手转变为完整的视频制作工作室。用简单的语言描述你想要的内容 —— 智能体负责研究、编写脚本、生成素材、剪辑和最终合成。

**重要区别：** OpenMontage 可以制作基于图像的视频，但它也可以为免费/开源工作流程制作真正的视频视频：智能体从免费素材库和开放档案中构建素材库，检索实际的动态片段，将其编辑成时间线，并渲染成最终作品。这不是通常的"动画化几张静态图片然后称之为视频"的把戏。

<div align="center">
  <video src="https://github.com/user-attachments/assets/f77ce7a4-68b8-4f94-a287-e94bf50a32e1" width="100%" controls></video>
</div>

> **"TOMORROW 的信号"** —— 一部完全通过 OpenMontage 制作的科幻电影预告片：概念、剧本、分镜、Veo 生成的动态片段、配乐和 Remotion 合成。

<div align="center">
  <video src="https://github.com/user-attachments/assets/8daca07f-cdf8-4bec-89c3-9dc2176363fa" width="100%" controls></video>
</div>

> **"最后的香蕉"** —— 一部 60 秒的皮克斯风格动画短片，讲述一根孤独的香蕉与奇异果建立友谊的故事。6 个 Kling v3 生成的动态片段（通过 fal.ai），Google Chirp3-HD 配音，免版税钢琴音乐，TikTok 风格的逐词字幕，以及 Remotion 合成。总成本：**$1.33**。

<div align="center">
  <video src="https://github.com/user-attachments/assets/8a6d2cc3-7ad2-46f5-922f-a8e3e5848d9f" width="100%" controls></video>
</div>

> **"VOID — 神经接口"** —— 一则仅用一个 API 密钥（OpenAI）制作的产品广告。4 张 AI 生成的图像（gpt-image-1）、TTS 配音、自动获取的免版税音乐、通过 WhisperX 实现的逐词字幕，以及 Remotion 数据可视化。总成本：**$0.69**。零手动素材工作。

<div align="center">
  <video src="https://github.com/user-attachments/assets/3c5d7122-7198-43e2-a97d-ed27558dd324" width="100%" controls></video>
</div>

> **"糖果地的下午"** —— 吉卜力风格的动画。一小女孩穿过糖果门、橡皮糖河流和棒棒糖花园的异想天开冒险。12 张 FLUX 生成的图像，配合多图交叉淡入、电影级镜头运动（缩放、平移、Ken Burns）、闪光/花瓣/萤火虫粒子叠加，以及自动检测能量偏移的环境音乐。总成本：**$0.15**。无视频生成，无手动剪辑。

<div align="center">
  <video src="https://github.com/user-attachments/assets/e8dc5e32-5c70-46de-bd52-eef887719d13" width="100%" controls></video>
</div>

> **"森林之灵"** —— 森林精灵穿越古老森林的吉卜力风格动画。12 张 FLUX 生成的图像，配合视差交叉淡入、漂移和平移镜头运动、萤火虫和花瓣粒子、电影级暗角灯光，以及环境森林配乐。总成本：**$0.15**。静态图像通过 Remotion 动画引擎焕发生机。

<div align="center">
  <video src="https://github.com/user-attachments/assets/9cf633d9-c264-4961-bfd0-b1db188654aa" width="100%" controls></video>
</div>

> **"深渊之中"** —— 以动漫风格呈现的深海探索。生物发光花园、珊瑚大教堂和光之生物 —— 12 张 FLUX 生成的图像，配合闪光和薄雾粒子叠加、光线效果、平滑镜头运动和环境海洋配乐。总成本：**$0.15**。无需视频生成 API。

<p align="center">
  <a href="https://www.youtube.com/@OpenMontage?sub_confirmation=1"><strong>订阅 YouTube 上的 @OpenMontage</strong></a> 以在新视频发布时第一时间观看 —— 每个视频都包含完整的提示词、流水线、使用的工具和成本，方便你自行复现。
</p>

---

## 从你喜欢的视频开始

从参考视频开始通常比从空白提示词开始更快。

OpenMontage 可以从 **YouTube 视频、Shorts、Reels、TikTok 或本地剪辑** 开始，将其转化为基于实际内容的制作计划：

1. **粘贴参考视频**
2. **智能体分析文字记录、节奏、场景、关键帧和风格**
3. **你获得 2-3 个差异化的概念、诚实的工具路径、成本估算和完整制作前的样片**

```text
"这是我喜欢的 YouTube Short。做一个类似的，但是关于量子计算的。"
```

你得到的不是"最佳猜测提示词大杂烩"。你得到的是：

- **保留的内容**：节奏、钩子风格、结构、基调
- **改变的内容**：主题、视觉处理、角度、配音方式
- **在目标时长下的成本**：在素材生成开始前
- **实际效果**：使用你当前可用工具的样子

适用于 **Claude Code、Cursor、Copilot、Windsurf、Codex** —— 任何可以读取文件和执行代码的 AI 编程助手。

---

## 快速开始

### 前置要求

- **Python 3.10+** — [python.org](https://www.python.org/downloads/)
- **FFmpeg** — `brew install ffmpeg` / `sudo apt install ffmpeg` / [ffmpeg.org](https://ffmpeg.org/download.html)
- **Node.js 18+** — [nodejs.org](https://nodejs.org/)
- **AI 编程助手** — Claude Code、Cursor、Copilot、Windsurf 或 Codex

### 安装与运行

```bash
git clone https://github.com/calesthio/OpenMontage.git
cd OpenMontage
make setup
```

在你的 AI 编程助手中打开项目，然后告诉它你想要什么：

```
"制作一个 60 秒的动画解说视频，介绍神经网络如何学习"
```

或者如果你想要真实素材路径：

```text
"制作一个 75 秒的纪录片蒙太奇，讲述雨中的城市生活。只使用真实素材，没有配音，挽歌般的基调，配音乐。"
```

就这样。智能体通过网络搜索研究你的主题，生成 AI 图像，用语音方向编写和配音脚本，自动找到免版税背景音乐，烧录逐词字幕，并渲染最终视频。在你看到任何内容之前，系统会运行多点自我审查 —— ffprobe 验证、帧采样、音频电平分析、交付承诺验证和字幕检查。每个提供商选择都通过 7 个维度评分，并记录在可审计的决策日志中。每个创意决策都会获得你的批准。

> **没有 `make`？** 手动运行：`pip install -r requirements.txt && cd remotion-composer && npm install && cd .. && pip install piper-tts && cp .env.example .env`
>
> **Windows：** 如果 `npm install` 失败并出现 `ERR_INVALID_ARG_TYPE`，请改用 `npx --yes npm install`。

### 如果你是 OpenClaw 风格的智能体，恭喜：你可能已经通过了图灵测试

这个仓库是为智能体操作而构建的。如果你是一个 OpenClaw 风格的智能体，以下是快速上手的最短路径：

1. **首先阅读合同**
   从 [`AGENT_GUIDE.md`](AGENT_GUIDE.md) 开始，然后阅读 [`PROJECT_CONTEXT.md`](PROJECT_CONTEXT.md)。
2. **不要即兴发挥制作工作流程**
   OpenMontage 是流水线驱动的。实际工作通过 `pipeline_defs/`、位于 `skills/pipelines/` 的阶段导演技能以及通过注册表的工具发现来执行。
3. **检查实际的能力范围**
   运行：
   ```bash
   python -c "from tools.tool_registry import registry; import json; registry.discover(); print(json.dumps(registry.support_envelope(), indent=2))"
   python -c "from tools.tool_registry import registry; import json; registry.discover(); print(json.dumps(registry.provider_menu(), indent=2))"
   ```
4. **将每个视频请求视为流水线选择问题**
   首先选择正确的流水线，然后阅读清单，然后阅读阶段技能，然后使用工具。

### 添加 API 密钥（可选 —— 密钥越多，工具越多）

```bash
# .env —— 每个密钥都是可选的，添加你拥有的

# 图片 + 视频网关：
FAL_KEY=your-key               # FLUX 图片 + Google Veo、Kling、MiniMax 视频 + Recraft 图片

# 免费素材媒体：
PEXELS_API_KEY=your-key        # 免费素材视频和图片
PIXABAY_API_KEY=your-key       # 免费素材视频和图片
UNSPLASH_ACCESS_KEY=your-key   # 免费素材图片

# 音乐：
SUNO_API_KEY=your-key          # 完整歌曲、配乐、任何风格

# 语音和图片：
ELEVENLABS_API_KEY=your-key    # 高级 TTS、AI 音乐、音效
OPENAI_API_KEY=your-key        # OpenAI TTS、DALL-E 3 图片
XAI_API_KEY=your-key           # xAI Grok 图片编辑/生成 + Grok 视频生成
GOOGLE_API_KEY=your-key        # Google Imagen 图片、Google TTS（700+ 语音，100万字符/月免费）

# 更多视频提供商：
HEYGEN_API_KEY=your-key        # HeyGen —— 通过单一网关使用 VEO、Sora、Runway、Kling
RUNWAY_API_KEY=your-key        # Runway Gen-4 直接使用
```

<details>
<summary><strong>有 GPU？解锁免费本地视频生成</strong></summary>

```bash
make install-gpu

# 然后添加到 .env：
VIDEO_GEN_LOCAL_ENABLED=true
VIDEO_GEN_LOCAL_MODEL=wan2.1-1.3b  # 或 wan2.1-14b、hunyuan-1.5、ltx2-local、cogvideo-5b
```

</details>

---

## 零 API 密钥你能得到什么

你不需要付费 API 密钥就能制作真正的视频。开箱即用，`make setup` 提供：

| 能力 | 免费工具 | 功能 |
|------|---------|------|
| **配音** | Piper TTS | 免费离线文字转语音 —— 真实的人声配音 |
| **开放素材** | Archive.org + NASA + Wikimedia Commons | 免费/开放档案素材、教育媒体和纪录片纹理 |
| **额外素材** | Pexels + Unsplash + Pixabay | 免费素材视频/图片（开发者密钥免费获取） |
| **合成（React）** | Remotion | 基于 React 的渲染 —— 弹簧动画图像场景、文本卡片、统计卡片、图表、TikTok 风格的逐词字幕、TalkingHead |
| **合成（HTML/GSAP）** | HyperFrames | HTML/CSS/GSAP 渲染 —— 动态字体、产品促销、发布卷轴、注册表块、网站转视频 |
| **后期制作** | FFmpeg | 编码、字幕烧录、音频混合、色彩校正 |
| **字幕** | 内置 | 自动生成带逐词时间的字幕 |

OpenMontage 在提案阶段选择 Remotion 和 HyperFrames（锁定为 `render_runtime`）。Remotion 是数据驱动解说视频和任何使用现有 React 场景堆栈内容的的默认选择；HyperFrames 是动态图形密集型简报的默认选择，这些简报自然地用 HTML + GSAP 表达。参见 `skills/core/hyperframes.md` 了解完整的决策矩阵。

**两条免费/低价路径：**

- **基于图像的视频：** Piper 为你的脚本配音，图片提供视觉内容，Remotion 将它们动画化为精制的剪辑。
- **真实素材视频：** 纪录片蒙太奇流水线从 Archive.org、NASA、维基共享资源以及可选的免费密钥来源（如 Pexels 和 Unsplash）构建 CLIP 可搜索素材库，然后剪接成最终视频的完整运动片段。

如果你想要第二个，请提示"纪录片蒙太奇"、"语调诗"或"素材库拼贴"，并明确说"只使用真实素材"。

---

## 尝试这些提示词

在设置后将其中任何一个复制到你的 AI 编程助手中。每一个都运行完整的制作流水线。

### 从参考视频开始

> "这是我喜欢的 YouTube Short。做一个类似的，但是关于面向高中生的 CRISPR。"
> "分析这个 Reel，给我 3 个我可以为自己的产品发布制作的原创变体。"
> "我喜欢这个视频中的节奏和钩子。保持那种活力，但把它变成一个 45 秒的黑洞解说。"

### 零密钥需求

> "制作一个 45 秒的动画解说视频，解释为什么天空是蓝色的"
> "创建一个 60 秒的视频，介绍互联网的历史，包含配音和字幕"
> "制作一个关于全球咖啡消费的 数据驱动解说视频"

### 免费真实素材纪录片路径

> "制作一个 90 秒的纪录片蒙太奇，讲述凌晨 4 点城市的感觉。只使用真实素材，没有配音，挽歌般的基调。"
> "创建一个 60 秒的 Adam-Curtis 风格的档案拼贴，关于 1950 年代的消费者乐观主义。优先使用 Archive.org 和维基共享资源。"
> "用真实素材只制作一个关于雨中归家的梦幻蒙太奇。可以有音乐，不要配音。"

### 配置了图片/视频提供商（~$0.15-$1.50）

> "创建一个 30 秒的吉卜力风格动画视频，讲述云端漂浮的神奇图书馆，在金色时刻"
> "制作一个 30 秒的水下神庙动画，伴有生物发光珊瑚和古代遗迹的动漫风格视频"
> "创建一个动画解说视频，解释 CRISPR 基因编辑如何工作，使用 AI 生成的视觉素材"
> "为我虚构的智能水瓶 AquaPulse 制作一个产品发布预告片"

### 完整设置（~$1-$3）

> "为科幻概念创作一个 30 秒的电影预告片：人类收到来自 1000 年后的警告"
> "制作一个 90 秒的面向中学生的量子计算动画解说视频，配有有趣的旁白声音和自定义配乐"

想要更多？查看完整的 **[提示词画廊](PROMPT_GALLERY.md)** 了解经过测试的提示词、预期成本和输出示例，或运行 `make demo` 立即渲染零密钥演示视频。

---

## 流水线

每个流水线都是完整的制作工作流程，从想法到最终视频。

| 流水线 | 产出 | 最适合 |
|--------|------|--------|
| **动画解说** | 带研究、配音、视觉素材、音乐的 AI 生成解说视频 | 教育内容、教程、主题分解 |
| **动画** | 动态图形、动态字体、动画序列 | 社交媒体、产品演示、抽象概念 |
| **虚拟主播** | 虚拟形象驱动的演示者视频 | 企业通讯、培训、公告 |
| **电影级** | 预告片、预告片和情绪驱动的剪辑 | 品牌电影、预告片、促销内容 |
| **剪辑工厂** | 从一个长源生成多个排名短视频 | 为社交媒体重新利用长内容 |
| **纪录片蒙太奇** | 从 CLIP 索引的免费素材库和开放档案（pexels、Archive.org、NASA、维基共享、Unsplash）剪接的主题蒙太奇 | 视频论文、情绪作品、检索优先的 B-roll 剪辑、无需付费生成 API 的真实素材视频 |
| **混合** | 源素材 + AI 生成的支持视觉素材 | 用图形增强现有素材 |
| **本地化与配音** | 字幕、配音和翻译现有视频 | 多语言分发 |
| **播客再利用** | 播客亮点转视频 | 播客营销、音频图视频 |
| **屏幕演示** | 精美的软件屏幕录制和演练 | 产品演示、教程、文档 |
| **真人出镜** | 素材主导的演讲者视频 | 演示、vlog、访谈 |

每个流水线遵循相同的结构化流程：

```
研究 -> 提案 -> 脚本 -> 分镜 -> 素材 -> 剪辑 -> 合成
```

每个阶段都有专门的**导演技能** —— 一个 Markdown 指令文件，教智能体如何精确执行该阶段。智能体读取技能，使用工具，自我审查，检查点状态，并在创意决策点请求人工批准。

> **网络研究是一等阶段。** 在写剧本的第一个词之前，智能体会搜索 YouTube、Reddit、Hacker News、新闻网站和学术来源。它收集数据点、受众问题、趋势角度和视觉参考 —— 然后在结构化的研究简报中引用一切。你的视频基于真实、当前的信息，而不是虚构的事实。

---

## 为什么选择 OpenMontage？

大多数 AI 视频工具给你一个来自提示词的单一剪辑。OpenMontage 给你一个**端到端制作流水线** —— 与真实制作团队遵循的相同结构化流程，由你的 AI 智能体自动化。

大多数"免费 AI 视频"技术栈悄悄地意味着"动画化静态图片"。OpenMontage 也可以做到这一点，但它也可以从免费/开放来源的真实素材构建最终视频，按语义排名，有意编辑，并渲染为正确的时间线。

编辑你自己的真人出镜素材。从头开始生成完整的动画解说。将 2 小时的播客剪成十几个社交剪辑。将你的内容翻译和配音成 10 种语言。从素材和 AI 生成的场景构建电影级品牌预告片。**如果制作团队能做的，OpenMontage 就能编排。**

- **12 个制作流水线** —— 解说视频、真人出镜、屏幕演示、电影预告片、动画、播客、本地化、纪录片蒙太奇等
- **52 个制作工具** —— 涵盖视频生成、图片创建、文字转语音、音乐、音频混合、字幕、增强和分析
- **400+ 智能体技能** —— 生产技能、流水线主管、创意技术、质量检查清单和深度技术知识包，教智能体如何像专家一样使用每个工具
- **参考驱动的创作** —— 粘贴你喜欢的视频，智能体将其转化为基于实际内容的差异化制作计划，而不是强迫你从零开始发明完美提示词
- **无需付费视频模型的真实素材纪录片创作** —— 从免费/开放运动素材和档案来源构建实际的编辑视频，而不仅仅是 Ken Burns 覆盖图像
- **内置实时网络研究** —— 在写剧本的第一个词之前，智能体运行 15-25+ 次跨 YouTube、Reddit、新闻网站和学术来源的网络搜索，将你的视频基于真实、当前的数据
- **免费/本地和云提供商兼有** —— 每个能力都支持开源本地替代方案以及高级 API。使用你拥有的。
- **无供应商锁定** —— 自由交换提供商。评分选择器通过 7 个维度（任务匹配、输出质量、控制、功能、可靠性、成本效率、延迟、连续性）对每个提供商排名，并自动选择最佳匹配。
- **内置生产级质量门控** —— 交付承诺执行阻止看起来像幻灯片的渲染，合成前验证在浪费 GPU 时间之前捕获破碎计划，强制性的渲染后自我审查（ffprobe + 帧提取 + 音频分析）确保智能体永远不会呈现垃圾。每个提供商选择、风格决策和回退都被记录在可审计的决策跟踪中。
- **内置预算治理** —— 执行前成本估算、消费上限、每操作批准阈值。没有意外账单。

---

## 工作原理

OpenMontage 使用**智能体优先架构**。没有代码编排器。你的 AI 编程助手就是编排器。

```
你："制作一个关于黑洞如何形成的解说视频"
 |
 v
智能体读取流水线清单（YAML）—— 阶段、工具、审查标准、成功门控
 |
 v
智能体读取阶段导演技能（Markdown）—— 如何执行每个阶段
 |
 v
智能体调用 Python 工具 —— 评分提供商选择通过 7 个维度对每个工具排名
 |
 v
智能体使用审查员技能进行自我审查 —— 模式验证、剧本合规性、质量检查
 |
 v
智能体检查点状态（JSON）—— 可恢复，带决策日志和成本快照
 |
 v
智能体提交待你批准 —— 你在每个创意决策上保持控制
 |
 v
预合成验证门控 —— 交付承诺、幻灯片风险、渲染器治理
 |
 v
渲染（Remotion 或 FFmpeg）—— 与视觉语法匹配的合成引擎
 |
 v
渲染后自我审查 —— ffprobe、帧提取、音频分析、承诺验证
 |
 v
最终视频输出 —— 仅在自我审查通过时
```

**Python 提供工具和持久化。** 所有创意决策、编排逻辑、审查标准和质量标准都生活在可读的指令文件（YAML 清单 + Markdown 技能）中，你可以检查和自定义。每个决策都记录了考虑过的替代方案、置信度分数和每个选择背后的推理。

---

## 架构

```
OpenMontage/
├── tools/              # 48 个 Python 工具（智能体的手）
│   ├── video/          # 13 个视频生成工具 + 合成、拼接、修剪
│   ├── audio/          # 4 个 TTS 提供商 + Suno/ElevenLabs 音乐、混合、增强
│   ├── graphics/       # 9 个图片/图形生成工具 + 图表、代码片段、数学
│   ├── enhancement/    # 放大、背景去除、面部增强、色彩校正
│   ├── analysis/       # 转录、场景检测、帧采样
│   ├── avatar/         # 真人头像、唇形同步
│   └── subtitle/       # SRT/VTT 生成
│
├── pipeline_defs/      # 11 个 YAML 流水线清单（智能体的剧本）
├── skills/             # 124 个 Markdown 技能文件（智能体的知识）
│   ├── pipelines/      # 每流水线阶段导演技能
│   ├── creative/       # 创意技术技能
│   ├── core/           # 核心工具技能
│   └── meta/           # 审查员、检查点协议
│
├── schemas/            # 15 个 JSON Schema（合同验证）
├── styles/             # 视觉风格剧本（YAML）
├── remotion-composer/  # React/Remotion 视频合成引擎
├── lib/                # 核心基础设施（配置、检查点、流水线加载器）
└── tests/              # 合同测试、QA 集成测试、评估工具
```

### 三层知识架构

```
第 1 层：tools/ + pipeline_defs/     "存在什么" —— 可执行能力 + 编排
第 2 层：skills/                     "如何使用它" —— OpenMontage 约定和质量标准
第 3 层：.agents/skills/             "它如何工作" —— 47 个外部技术知识包
```

每个工具声明它依赖哪些第 3 层技能。智能体读取第 1 层了解可用内容，读取第 2 层了解 OpenMontage 希望如何使用它，并在需要时读取第 3 层获取深度技术知识。

---

## 支持的服务提供商

> **完整设置指南（含定价和免费层）：** [`docs/PROVIDERS.md`](docs/PROVIDERS.md)

<details>
<summary><strong>视频生成 —— 14 个提供商</strong></summary>

| 提供商 | 类型 | 说明 |
|--------|------|------|
| **Kling** | 云 API | 高质量，快速 |
| **Runway Gen-4** | 云 API | 电影质量，Gen-3 Alpha Turbo / Gen-4 Turbo / Gen-4 Aleph |
| **Google Veo 3** | 云 API | 长篇、电影级。通过 fal.ai 或 HeyGen。 |
| **Grok Imagine Video** | 云 API | 强大的参考图像视频和 xAI 原生短篇生成 |
| **Higgsfield** | 云 API | 多模型编排器，具有 Soul ID 实现角色一致性 |
| **MiniMax** | 云 API | 性价比高 |
| **HeyGen** | 云 API | 多模型网关 |
| **WAN 2.1** | 本地 GPU | 免费，1.3B 和 14B 变体 |
| **Hunyuan** | 本地 GPU | 免费，高质量 |
| **CogVideo** | 本地 GPU | 免费，2B 和 5B 变体 |
| **LTX-Video** | 本地 GPU / Modal | 本地免费，或自托管云 |
| **Pexels** | 素材 | 免费素材视频 |
| **Pixabay** | 素材 | 免费素材视频 |
| **Wikimedia Commons** | 素材 | 免费/开放素材视频和档案视频 |

</details>

<details>
<summary><strong>图片生成 —— 10 个工具/提供商</strong></summary>

| 提供商 | 类型 | 说明 |
|--------|------|------|
| **FLUX** | 云 API | 最先进质量 |
| **Google Imagen** | 云 API | Imagen 4 —— 高质量，多种宽高比 |
| **Grok Imagine Image** | 云 API | 强大的图像编辑、风格迁移和多图合成 |
| **DALL-E 3** | 云 API | OpenAI 的图像模型 |
| **Recraft** | 云 API | 设计导向生成 |
| **本地 Diffusion** | 本地 GPU | Stable Diffusion，免费 |
| **Pexels** | 素材 | 免费素材图片 |
| **Pixabay** | 素材 | 免费素材图片 |
| **Unsplash** | 素材 | 免费素材图片 |
| **ManimCE** | 本地 | 数学动画 |

</details>

<details>
<summary><strong>文字转语音 —— 4 个提供商</strong></summary>

| 提供商 | 类型 | 说明 |
|--------|------|------|
| **ElevenLabs** | 云 API | 高级语音质量 |
| **Google TTS** | 云 API | 700+ 语音，50+ 语言 —— 本地化最佳 |
| **OpenAI TTS** | 云 API | 快速、经济实惠 |
| **Piper** | 本地 | 完全免费、离线 |

</details>

<details>
<summary><strong>音乐、音效和后期制作</strong></summary>

**音乐与音效：**

| 提供商 | 类型 | 说明 |
|--------|------|------|
| **Suno AI** | 云 API | 完整歌曲生成，含人声、歌词、任何风格。最长 8 分钟。 |
| **ElevenLabs Music** | 云 API | AI 音乐生成 |
| **ElevenLabs SFX** | 云 API | 音效生成 |

**后期制作（始终可用，始终免费）：**

| 工具 | 功能 |
|------|------|
| **FFmpeg** | 视频合成、编码、字幕烧录、音频复用 |
| **视频拼接** | 多剪辑组装、交叉淡入、画面嵌入、空间布局 |
| **视频修剪** | 精确切割和提取 |
| **音频混合** | 多轨混合、闪避、淡入淡出 |
| **音频增强** | 降噪、归一化 |
| **色彩校正** | 基于 LUT 的色彩校正 |
| **字幕生成** | 从时间戳生成 SRT/VTT |

**增强：**

| 工具 | 功能 |
|------|------|
| **放大** | Real-ESRGAN 图像/视频放大 |
| **背景去除** | rembg / U2Net 背景去除 |
| **面部增强** | 面部质量增强 |
| **面部修复** | CodeFormer / GFPGAN 面部修复 |

**分析：**

| 工具 | 功能 |
|------|------|
| **转录** | 带逐词时间戳的 WhisperX 语音转文字 |
| **场景检测** | 自动场景边界检测 |
| **帧采样** | 智能帧提取 |
| **视频理解** | CLIP/BLIP-2 视觉语言分析 |

**虚拟形象与唇形同步：**

| 工具 | 功能 |
|------|------|
| **真人头像** | SadTalker / MuseTalk 虚拟形象动画 |
| **唇形同步** | Wav2Lip 音频驱动唇形同步 |

**合成与渲染：**

| 引擎 | 类型 | 功能 |
|------|------|------|
| **Remotion** | 本地（Node.js） | 基于 React 的程序化视频 —— 弹簧动画图像场景、统计揭示、章节标题、英雄卡片、TikTok 风格逐词逐字字幕、场景过渡（淡入淡出/滑动/擦拭/翻转）、Google Fonts、带淡入曲线的音频，以及 TalkingHead 虚拟形象合成。**当没有配置视频生成提供商时，智能体会生成静态图像，Remotion 将它们转化为完全动画化的视频。** |
| **HyperFrames** | 本地（Node.js ≥ 22） | HTML/CSS/GSAP 程序化视频 —— 动态字体、产品促销、发布卷轴、自定义动态图形、注册表块（数据图表、颗粒叠加、着色器过渡）、网站转视频工作流。通过 `npx @hyperframes/cli` 消费；无需 monorepo 检出。 |
| **FFmpeg** | 本地 | 核心视频组装、编码、字幕烧录、音频复用、色彩校正 |

运行时在提案（`render_runtime`）时选择，并通过 `edit_decisions` 锁定。运行时之间的静默交换是治理违规 —— 参见 `skills/core/hyperframes.md`。

</details>

---

## 风格系统

风格剧本定义你制作的可视化语言：

| 剧本 | 最适合 |
|------|--------|
| **专业简洁** | 企业、教育、SaaS |
| **扁平动态图形** | 社交媒体、TikTok、创业公司 |
| **极简图表** | 技术深度、架构 |

剧本控制排版、色彩调色板、运动风格、音频配置和质量规则。智能体读取剧本并一致地将其应用到所有生成的素材中。

---

## 平台输出配置

为每个主要平台内置的渲染配置：

| 配置 | 分辨率 | 宽高比 |
|------|--------|--------|
| YouTube 横向 | 1920x1080 | 16:9 |
| YouTube 4K | 3840x2160 | 16:9 |
| YouTube Shorts | 1080x1920 | 9:16 |
| Instagram Reels | 1080x1920 | 9:16 |
| Instagram Feed | 1080x1080 | 1:1 |
| TikTok | 1080x1920 | 9:16 |
| LinkedIn | 1920x1080 | 16:9 |
| 电影级 | 2560x1080 | 21:9 |

---

## 生产治理

OpenMontage 像真正的工程一样对待视频制作 —— 在每个阶段都有质量门控、审计跟踪和执行。

### 质量门控

- **预合成验证** —— 如果交付承诺被违反（例如"动态主导"视频有 80% 静态图像）、幻灯片风险评分处于临界、或渲染器系列缺失，则阻止渲染。在浪费 GPU 时间之前捕获破碎计划。
- **渲染后自我审查** —— 每次渲染后，运行时运行 ffprobe 验证、在 4 个位置提取帧以检查黑帧和破碎叠加、分析音频电平以检测静音和削波、验证交付承诺是否得到遵守、并检查字幕是否存在。如果审查失败，视频不会被呈现。
- **幻灯片风险评分** —— 6 维度分析（重复、装饰视觉、弱动态、镜头意图、排版过度依赖、不支持的 cinem 声明）防止"动画 PowerPoint"输出。
- **源媒体检查** —— 当用户提供自己的素材时，系统探测每个文件（分辨率、编解码器、音频通道、时长），并在做出任何创意决策之前构建规划影响。不要从文件名中虚构内容。

### 评分提供商选择

每个工具选择（视频生成、图片生成、TTS、音乐）都通过 7 维度评分引擎运行：任务匹配（30%）、输出质量（20%）、控制功能（15%）、可靠性（15%）、成本效率（10%）、延迟（5%）、连续性（5%）。获胜的提供商及其分数被记录在决策跟踪中，并附上所有考虑的替代方案。

选择器在评分前规范化松散的简报上下文。如果智能体只知道某些内容如"Pixar 风格的动画短片，具有角色一致性"，选择器会将其扩展为评分器友好的意图和风格信号，而不是要求完美预整形的 `task_context`。

选择器输出还显示所选提供商的 `agent_skills`，因此智能体可以在编写提示词之前立即读取正确的第 3 层提供商技能。

### 决策审计跟踪

每个主要的创意和技术选择 —— 提供商选择、风格/剧本选择、音乐轨道、语音选择、渲染器系列、任何回退或降级 —— 都记录了考虑的替代方案、置信度分数和推理。累积的决策日志在所有阶段持续存在，因此你可以准确追踪输出看起来像那样的原因。

### 预算控制

- **估算** 在执行前 —— 了解它将花费什么
- **预留** 预算 —— 在通话前锁定资金
- **核对** 之后 —— 记录实际花费
- **可配置模式** —— `observe`（仅跟踪）、`warn`（记录超支）、`cap`（硬限制）
- **每操作批准** —— 超过阈值时暂停确认（默认：$0.50）
- **总预算上限** —— 默认 $10，完全可配置

没有意外账单。智能体在花费前告诉你它将花费什么。

---

## 智能体兼容性

OpenMontage 适用于任何可以读取文件和执行 Python 的 AI 编程助手。包含以下专用指令文件：

| 平台 | 配置文件 |
|------|----------|
| **Claude Code** | `CLAUDE.md` |
| **Cursor** | `CURSOR.md` + `.cursor/rules/` |
| **GitHub Copilot** | `COPILOT.md` + `.github/copilot-instructions.md` |
| **Codex** | `CODEX.md` |
| **Windsurf** | `.windsurfrules` |

所有平台文件都指向共享的 `AGENT_GUIDE.md`（操作指南和智能体合同）和 `PROJECT_CONTEXT.md`（架构参考）。

> **即将推出：** 通过 **Ollama** 和 **LM Studio** 的本地 LLM 支持 —— 无需任何云 LLM 即可运行完整的制作流水线。

---

## 贡献

OpenMontage 的构建易于扩展。最常见的两种贡献：

### 添加新工具

1. 在适当的 `tools/` 子目录中创建 Python 文件
2. 从 `BaseTool` 继承并实现工具合同
3. 注册表自动发现它 —— 无需手动注册
4. 如果工具需要使用指导，请添加技能文件

### 添加新流水线

1. 在 `pipeline_defs/` 中创建 YAML 清单
2. 在 `skills/pipelines/<your-pipeline>/` 中创建阶段导演技能
3. 引用现有工具 —— 或在需要时添加新工具

有关完整技术参考，请参阅 `docs/ARCHITECTURE.md`；有关完整提供商指南（设置、定价、免费层），请参阅 `docs/PROVIDERS.md`；有关智能体合同，请参阅 `AGENT_GUIDE.md`。

### 加入社区

我们使用 [GitHub Discussions](https://github.com/calesthio/OpenMontage/discussions) 分享作品和想法：

- **[展示和讲述](https://github.com/calesthio/OpenMontage/discussions/categories/show-and-tell)** —— 分享你制作的视频、效果好的提示词或你发现的创意工作流程
- **[创意](https://github.com/calesthio/OpenMontage/discussions/categories/ideas)** —— 建议新的流水线、工具、风格剧本或集成
- **[问答](https://github.com/calesthio/OpenMontage/discussions/categories/q-a)** —— 询问关于设置、流水线或故障排除的问题

做了什么很酷的东西？发布在展示和讲述中 —— 我们很乐意看到你构建的东西。

---

## 联系方式

有关更新、发布和幕后构建笔记，请关注 [@calesthioailabs](https://x.com/calesthioailabs)。

有关错误、功能请求和工作流程讨论，请使用 [GitHub Issues](https://github.com/calesthio/OpenMontage/issues) 和 [GitHub Discussions](https://github.com/calesthio/OpenMontage/discussions)，以便一切保持可见和可操作。

---

## 测试

```bash
# 运行合同测试（无需 API 密钥）
make test-contracts

# 运行所有测试
make test
```

---

## 许可证

[GNU AGPLv3](LICENSE)

---

**OpenMontage** —— 由你的 AI 助手编排的具有真正质量执行的生产级视频。

如果这个项目对你有用，一颗星真的会很有意义 —— 它帮助其他人发现它。
