components {
  id: "star"
  component: "/prefabs/star.script"
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
