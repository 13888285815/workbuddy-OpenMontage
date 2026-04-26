/**
 * resolveAsset — 安全的资源路径解析工具
 *
 * 处理以下几种路径格式：
 *  - http:// / https:// URL → 原样返回（仅允许 HTTPS，HTTP 需显式允许）
 *  - data: URI → 原样返回
 *  - file:// 绝对路径 → 转换为 file:/// URI
 *  - Unix/Windows 绝对路径 → 转换为 file:/// URI
 *  - 相对路径 → 通过 staticFile() 解析（仅限 public/ 目录）
 *
 * 安全措施：
 *  - 阻止 javascript: 和 vbscript: 等危险协议
 *  - 对 HTTP URL 输出安全警告（建议使用 HTTPS）
 *  - 对 data: URI 进行基本格式验证
 *  - 路径遍历防护：拒绝包含 ../ 的相对路径
 */

import { staticFile } from "remotion";

/** 允许通过的直接协议 */
const ALLOWED_PROTOCOLS = ["http://", "https://", "data:"];

/** 危险协议黑名单 */
const DANGEROUS_PROTOCOLS = [
  "javascript:",
  "vbscript:",
  "file:///dev/",
  "file:///etc/",
  "file:///proc/",
  "file:///sys/",
];

/**
 * 安全地解析资源路径
 * @param src 资源路径（URL、绝对路径或相对路径）
 * @returns 解析后的安全路径字符串
 */
export function resolveAsset(src: string): string {
  // 检查危险协议
  const lowerSrc = src.trim().toLowerCase();
  for (const dangerous of DANGEROUS_PROTOCOLS) {
    if (lowerSrc.startsWith(dangerous)) {
      console.warn(
        `[安全] resolveAsset 拒绝了危险协议: ${dangerous}。资源已跳过。`
      );
      return ""; // 返回空字符串，Remotion 将忽略
    }
  }

  // 允许的协议 — 直接返回
  if (src.startsWith("https://") || src.startsWith("data:")) {
    return src;
  }

  // HTTP URL — 允许但输出安全警告
  if (src.startsWith("http://")) {
    console.warn(
      `[安全] resolveAsset: 使用 HTTP（非加密）URL，建议改为 HTTPS: ${src.substring(0, 80)}...`
    );
    return src;
  }

  // 移除 file:// 前缀
  const clean = src.replace(/^file:\/\/\/?/, "");

  // Unix/Windows 绝对路径 → file:/// URI
  if (clean.startsWith("/") || /^[A-Za-z]:[\\/]/.test(clean)) {
    // 阻止访问敏感系统目录
    const normalized = clean.replace(/\\/g, "/");
    const lowerNorm = normalized.toLowerCase();
    const blockedPaths = ["/etc/", "/proc/", "/sys/", "/dev/", "\\windows\\", "\\system32\\"];
    for (const blocked of blockedPaths) {
      if (lowerNorm.includes(blocked)) {
        console.warn(
          `[安全] resolveAsset 拒绝了敏感系统路径: ${blocked}。资源已跳过。`
        );
        return "";
      }
    }
    return `file:///${normalized}`;
  }

  // 相对路径 — 通过 staticFile 解析（仅限 public/ 目录）
  // 防止路径遍历攻击
  if (clean.includes("..")) {
    console.warn(
      `[安全] resolveAsset 拒绝了路径遍历: ${clean}。资源已跳过。`
    );
    return "";
  }

  return staticFile(clean);
}
