
function old_biterrunanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        width = 169*2,
        height = 114*2,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.714844 *2, scale * -0.246094*2},
        scale = scale,
        stripes =
        {
         {
          filename = modgraphics .. "entity/biter/biter-run-1.png",
          width_in_frames = 8,
          height_in_frames = 16
         },
         {
          filename = modgraphics .. "entity/biter/biter-run-2.png",
          width_in_frames = 8,
          height_in_frames = 16
         }
        }
      },
      {
        width = 169*2,
        height = 114*2,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.714844 *2, scale * -0.246094*2},
        scale = scale,
        draw_as_shadow = true,
        stripes =
        {
         {
          filename = modgraphics .. "entity/biter/biter-run-1-shadow.png",
          width_in_frames = 8,
          height_in_frames = 16
         },
         {
          filename = modgraphics .. "entity/biter/biter-run-2-shadow.png",
          width_in_frames = 8,
          height_in_frames = 16
         }
        }
      },
      {
        filename = modgraphics .. "entity/biter/biter-run-mask1.png",
        flags = { "mask" },
        width = 105*2,
        height = 81*2,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.117188*2, scale * -0.867188*2},
        scale = scale,
        tint = tint1
      },
      {
        filename = modgraphics .. "entity/biter/biter-run-mask2.png",
        flags = { "mask" },
        line_length = 16,
        width = 95*2,
        height = 81*2,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.117188*2, scale * -0.855469*2},
        scale = scale,
        tint = tint2
      }
    }
  }
end

function old_biterattackanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        width = 558,
        height = 368,
        frame_count = 11,
        direction_count = 16,
        shift = {scale * 1.74609*2, scale * -0.644531*2},
        animation_speed = 0.3,
        scale = scale,
        stripes =
        {
         {
          filename = modgraphics .. "entity/biter/biter-attack-1.png",
          width_in_frames = 6,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity/biter/biter-attack-2.png",
          width_in_frames = 5,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity/biter/biter-attack-3.png",
          width_in_frames = 6,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity/biter/biter-attack-4.png",
          width_in_frames = 5,
          height_in_frames = 8
         }
        }
      },

      {
        width = 558,
        height = 368,
        frame_count = 11,
        direction_count = 16,
        shift = {scale * 1.74609*2, scale * -0.644531*2},
        animation_speed = 0.3,
        scale = scale,
        draw_as_shadow = true,
        stripes =
        {
         {
          filename = modgraphics .. "entity/biter/biter-attack-1-shadow.png",
          width_in_frames = 6,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity/biter/biter-attack-2-shadow.png",
          width_in_frames = 5,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity/biter/biter-attack-3-shadow.png",
          width_in_frames = 6,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity/biter/biter-attack-4-shadow.png",
          width_in_frames = 5,
          height_in_frames = 8
         }
        }
      },

      {
        filename = modgraphics .. "entity/biter/biter-attack-mask1.png",
        flags = { "mask" },
        width = 250,
        height = 216,
        frame_count = 11,
        direction_count = 16,
        shift = {scale * 0.117188*2, scale * -1.11328*2},
        scale = scale,
        tint = tint1
      },

      {
        filename = modgraphics .. "entity/biter/biter-attack-mask2.png",
        flags = { "mask" },
        width = 228,
        height = 200,
        frame_count = 11,
        direction_count = 16,
        shift = {scale * 0.117188*2, scale * -1.06641*2},
        scale = scale,
        tint = tint2
      }
    }
  }
end

function old_biterdieanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        width = 380,
        height = 258,
        frame_count = 17,
        direction_count = 16,
        shift = {scale * 0.621094*2, scale * -0.1875*2},
        scale = scale,
        stripes =
        {
          {
            filename = modgraphics .. "entity/biter/biter-die-1.png",
            width_in_frames = 9,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/biter/biter-die-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/biter/biter-die-3.png",
            width_in_frames = 9,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/biter/biter-die-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      },
      {
        width = 380,
        height = 258,
        frame_count = 17,
        direction_count = 16,
        shift = {scale * 0.621094*2, scale * -0.1875*2},
        scale = scale,
        draw_as_shadow = true,
        stripes =
        {
          {
            filename = modgraphics .. "entity/biter/biter-die-1-shadow.png",
            width_in_frames = 9,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/biter/biter-die-2-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/biter/biter-die-3-shadow.png",
            width_in_frames = 9,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/biter/biter-die-4-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      },

      {
        filename = modgraphics .. "entity/biter/biter-die-mask1.png",
        flags = { "mask" },
        width = 240,
        height = 218,
        frame_count = 17,
        direction_count = 16,
        shift = {scale * 0.117188*2, scale * -0.574219*2},
        scale = scale,
        tint = tint1
      },

      {
        filename = modgraphics .. "entity/biter/biter-die-mask2.png",
        flags = { "mask" },
        width = 230,
        height = 216,
        frame_count = 17,
        direction_count = 16,
        shift = {scale * 0.128906*2, scale * -0.585938*2},
        scale = scale,
        tint = tint2
      }
    }
  }
end
