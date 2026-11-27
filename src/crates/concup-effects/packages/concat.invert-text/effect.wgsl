struct Params { amount: f32 }

fn effect(uv: vec2<f32>) -> vec4<f32> {
    let c = sample(uv);
    let amount = params.amount / 100.0;
    let inv = vec3<f32>(1.0, 1.0, 1.0) - c.rgb;
    let out = mix(c.rgb, inv, amount);
    return vec4<f32>(out, c.a);
}
