// SPDX-License-Identifier: AGPL-3.0-or-later
// SPDX-FileCopyrightText: 2026 Jareer Abdullah and Concat contributors

// Mix: direct smooth crossfade blending seamlessly between two clips without dipping to black.

fn blend(a: vec4<f32>, b: vec4<f32>, w: f32) -> vec4<f32> {
    let alpha = mix(a.a, b.a, w);
    let rgb = mix(a.rgb * a.a, b.rgb * b.a, w);
    return vec4<f32>(rgb / max(alpha, 1e-6), alpha);
}

fn transition(uv: vec2<f32>, progress: f32) -> vec4<f32> {
    let p = clamp(progress, 0.0, 1.0);
    let from_color = from_at(uv);
    let to_color = to_at(uv);
    return blend(from_color, to_color, p);
}
