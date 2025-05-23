
function old_spawner_idle_animation(variation, tint)
return
  {
    layers =
    {
      {
        filename = modgraphics .. "entity/spawner/spawner-idle.png",
        line_length = 8,
        width = 243*2,
        height = 181*2,
        frame_count = 8,
        animation_speed = 0.18,
        direction_count = 1,
        run_mode = "forward-then-backward",
        shift = {(0.140625 - 0.65), -0.234375},
        y = variation * 181 *2,
        scale = 0.5,
      },
      {
        filename = modgraphics .. "entity/spawner/spawner-idle-shadow.png",
        line_length = 8,
        width = 243*2,
        height = 181*2,
        frame_count = 8,
        animation_speed = 0.18,
        direction_count = 1,
        run_mode = "forward-then-backward",
        shift = {(0.140625 - 0.65), -0.234375},
        draw_as_shadow = true,
        y = variation * 181 *2,
        scale = 0.5,
      },
      {
        filename = modgraphics .. "entity/spawner/spawner-idle-mask.png",
        flags = { "mask" },
        width = 166*2,
        height = 148*2,
        frame_count = 8,
        animation_speed = 0.18,
        run_mode = "forward-then-backward",
        shift = {(-0.34375 - 0.65), -0.375},
        line_length = 8,
        tint = tint,
        y = variation * 148 *2,
        scale = 0.5,
      }
    }
  }
end

function old_spawner_die_animation(variation, tint)
return
  {
    layers =
    {
      {
        width = 255*2,
        height = 184*2,
        frame_count = 20,
        direction_count = 1,
        shift = {(-0.015625 - 0.65), -0.28125},
        scale = 0.5,
        stripes =
        {
         {
          filename = modgraphics .. "entity/spawner/spawner-die-01.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 184 *2
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-02.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 184 *2
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-03.png",
          width_in_frames = 6,
          height_in_frames = 4,
          y = variation * 184 *2
         }
        }
      },
      {
        width = 255*2,
        height = 184*2,
        frame_count = 20,
        direction_count = 1,
        shift = {(-0.015625 - 0.65), -0.28125},
        scale = 0.5,
        draw_as_shadow = true,
        stripes =
        {
         {
          filename = modgraphics .. "entity/spawner/spawner-die-01-shadow.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 184 *2
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-02-shadow.png",
          width_in_frames = 7,
          height_in_frames = 4,
          y = variation * 184 *2
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-03-shadow.png",
          width_in_frames = 6,
          height_in_frames = 4,
          y = variation * 184 *2
         }
        }
      },
      {
        flags = { "mask" },
        width = 166*2,
        height = 148*2,
        frame_count = 20,
        direction_count = 1,
        shift = {(-0.34375 - 0.65), -0.375},
        scale = 0.5,
        tint = tint,
        stripes =
        {
         {
          filename = modgraphics .. "entity/spawner/spawner-die-mask-01.png",
          width_in_frames = 10,
          height_in_frames = 4,
          y = variation * 148 *2
         },
         {
          filename = modgraphics .. "entity/spawner/spawner-die-mask-02.png",
          width_in_frames = 10,
          height_in_frames = 4,
          y = variation * 148 *2
         }
        }
      }
    }
  }
end

