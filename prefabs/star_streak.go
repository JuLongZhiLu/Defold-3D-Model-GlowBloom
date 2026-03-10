components {
  id: "star"
  component: "/prefabs/star.script"
}
components {
  id: "billboard"
  component: "/prefabs/billboard.script"
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/prefabs/star_streak.glb\"\n"
  "name: \"{{NAME}}\"\n"
  "materials {\n"
  "  name: \"material_0\"\n"
  "  material: \"/materials/glow.material\"\n"
  "  textures {\n"
  "    sampler: \"tex0\"\n"
  "    texture: \"/assets/images/brown.png\"\n"
  "  }\n"
  "}\n"
  ""
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"anim\"\n"
  "material: \"/materials/billboard.material\"\n"
  "blend_mode: BLEND_MODE_ADD\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/builtins/graphics/particle_blob.tilesource\"\n"
  "}\n"
  ""
  scale {
    x: 0.5
    y: 0.5
  }
}
