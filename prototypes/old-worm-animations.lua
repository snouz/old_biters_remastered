
function old_worm_folded_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filename = modgraphics .. "entity/worm/worm-folded.png",
        run_mode = "forward-then-backward",
        line_length = 5,
        width = 143*2,
        height = 104*2,
        frame_count = 5,
        shift = {scale * 0.09375 *2, scale * -0.046875 *2},
        direction_count = 1,
        scale = scale
      },
      {
        filename = modgraphics .. "entity/worm/worm-folded-shadow.png",
        run_mode = "forward-then-backward",
        line_length = 5,
        width = 143*2,
        height = 104*2,
        frame_count = 5,
        draw_as_shadow = true,
        shift = {scale * 0.09375 *2, scale * -0.046875 *2},
        direction_count = 1,
        scale = scale
      },
      {
        filename = modgraphics .. "entity/worm/worm-folded-mask.png",
        flags = { "mask" },
        run_mode = "forward-then-backward",
        line_length = 5,
        width = 60*2,
        height = 51*2,
        frame_count = 5,
        shift = {scale * 0.078125 *2, scale * -0.09375 *2},
        scale = scale,
        direction_count = 1,
        tint = tint
      }
    }
  }
end

function old_worm_preparing_animation(scale, tint, run_mode)
  return
  {
    layers=
    {
      {
        width = 208*2,
        height = 148*2,
        line_length = 13,
        frame_count = 26,
        shift = {scale * 1.10938 *2, scale * -0.734375 *2},
        run_mode = run_mode,
        scale = scale,
        direction_count = 1,
        stripes =
        {
         {
          filename = modgraphics .. "entity/worm/worm-preparing-01.png",
          width_in_frames = 7,
          height_in_frames = 2
         },
         {
          filename = modgraphics .. "entity/worm/worm-preparing-02.png",
          width_in_frames = 6,
          height_in_frames = 2
         }
        }
      },
      {
        width = 208*2,
        height = 148*2,
        line_length = 13,
        frame_count = 26,
        shift = {scale * 1.10938 *2, scale * -0.734375 *2},
        run_mode = run_mode,
        scale = scale,
        direction_count = 1,
        draw_as_shadow = true,
        stripes =
        {
         {
          filename = modgraphics .. "entity/worm/worm-preparing-01-shadow.png",
          width_in_frames = 7,
          height_in_frames = 2
         },
         {
          filename = modgraphics .. "entity/worm/worm-preparing-02-shadow.png",
          width_in_frames = 6,
          height_in_frames = 2
         }
        }
      },
      {
        filename = modgraphics .. "entity/worm/worm-preparing-mask.png",
        flags = { "mask" },
        line_length = 13,
        width = 98*2,
        height = 121*2,
        frame_count = 26,
        shift = {scale * 0.171875 *2, scale * -1.15625 *2},
        run_mode = run_mode,
        scale = scale,
        direction_count = 1,
        tint = tint
      }
    }
  }
end

function old_worm_prepared_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filename = modgraphics .. "entity/worm/worm-prepared.png",
        run_mode = "forward-then-backward",
        line_length = 10,
        width = 190*2,
        height = 156*2,
        frame_count = 10,
        scale = scale,
        direction_count = 1,
        shift = {scale * 0.828125 *2, scale * -0.890625 *2}
      },
      {
        filename = modgraphics .. "entity/worm/worm-prepared-shadow.png",
        run_mode = "forward-then-backward",
        line_length = 10,
        width = 190*2,
        height = 156*2,
        frame_count = 10,
        scale = scale,
        direction_count = 1,
        draw_as_shadow = true,
        shift = {scale * 0.828125 *2, scale * -0.890625 *2}
      },
      {
        filename = modgraphics .. "entity/worm/worm-prepared-mask.png",
        flags = { "mask" },
        run_mode = "forward-then-backward",
        line_length = 10,
        width = 80*2,
        height = 129*2,
        frame_count = 10,
        shift = {scale * 0.078125 *2, scale * -1.28125 *2},
        scale = scale,
        direction_count = 1,
        tint = tint
      }
    }
  }
end

function old_worm_attack_animation(scale, tint, run_mode)
  return
  {
    layers=
    {
      {
        width = 248*2,
        height = 196*2,
        frame_count = 8,
        direction_count = 16,
        shift = {scale * 0.953125 *2, scale * -0.671875 *2},
        scale = scale,
        run_mode = run_mode,
        stripes =
        {
         {
          filename = modgraphics .. "entity/worm/worm-attack-01.png",
          width_in_frames = 8,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity/worm/worm-attack-02.png",
          width_in_frames = 8,
          height_in_frames = 8
         }
        }
      },
      {
        width = 248*2,
        height = 196*2,
        frame_count = 8,
        direction_count = 16,
        shift = {scale * 0.953125 *2, scale * -0.671875 *2},
        scale = scale,
        run_mode = run_mode,
        draw_as_shadow = true,
        stripes =
        {
         {
          filename = modgraphics .. "entity/worm/worm-attack-01-shadow.png",
          width_in_frames = 8,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity/worm/worm-attack-02-shadow.png",
          width_in_frames = 8,
          height_in_frames = 8
         }
        }
      },
      {
        flags = { "mask" },
        width = 168*2,
        height = 153*2,
        frame_count = 8,
        direction_count = 16,
        shift = {scale * 0.078125 *2, scale * -1.125 *2},
        scale = scale,
        tint = tint,
        run_mode = run_mode,
        stripes =
        {
         {
          filename = modgraphics .. "entity/worm/worm-attack-mask-01.png",
          width_in_frames = 8,
          height_in_frames = 8
         },
         {
          filename = modgraphics .. "entity//worm/worm-attack-mask-02.png",
          width_in_frames = 8,
          height_in_frames = 8
         }
        }
      }
    }
  }
end

function old_worm_die_animation(scale, tint)
  return
  {
    layers=
    {
      {
        filename = modgraphics .. "entity/worm/worm-die.png",
        line_length = 6,
        width = 198*2,
        height = 171*2,
        frame_count = 24,
        shift = {scale * 0.953125 *2, scale * -0.625 *2},
        direction_count = 1,
        scale = scale
      },
      {
        filename = modgraphics .. "entity/worm/worm-die-shadow.png",
        line_length = 6,
        width = 198*2,
        height = 171*2,
        frame_count = 24,
        shift = {scale * 0.953125 *2, scale * -0.625 *2},
        direction_count = 1,
        draw_as_shadow = true,
        scale = scale
      },
      {
        filename = modgraphics .. "entity/worm/worm-die-mask.png",
        flags = { "mask" },
        line_length = 6,
        width = 143*2,
        height = 133*2,
        frame_count = 24,
        shift = {scale * 0.5625 *2, scale * -1.21875 *2},
        direction_count = 1,
        scale = scale,
        tint = tint
      }
    }
  }
end
