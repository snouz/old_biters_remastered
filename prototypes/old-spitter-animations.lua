
function old_spitterattackanimation(scale, tint)
  return
  {
    layers =
    {
      {
        width = 199*2,
        height = 164*2,
        frame_count = 22,
        direction_count = 16,
        scale = scale,
        shift = {scale * 0.765625 *2, scale * 0.0625 *2},
        animation_speed = 0.4,
        stripes =
        {
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-1.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-3.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-5.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-6.png",
            width_in_frames = 6,
            height_in_frames = 8
          }
        }
      },
      {
        width = 199*2,
        height = 164*2,
        frame_count = 22,
        direction_count = 16,
        scale = scale,
        shift = {scale * 0.765625 *2, scale * 0.0625 *2},
        animation_speed = 0.4,
        draw_as_shadow = true,
        stripes =
        {
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-1-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-2-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-3-shadow.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-4-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-5-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-6-shadow.png",
            width_in_frames = 6,
            height_in_frames = 8
          }
        }
      },
      {
        flags = { "mask" },
        width = 108*2,
        height = 90*2,
        frame_count = 22,
        direction_count = 16,
        shift = {0, scale * -0.625 *2},
        scale = scale,
        tint = tint,
        animation_speed = 0.4,
        stripes =
        {
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-mask-1.png",
            width_in_frames = 11,
            height_in_frames = 16
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-attack-mask-2.png",
            width_in_frames = 11,
            height_in_frames = 16
          }
        }
      }
    }
  }
end

function old_spitterrunanimation(scale, tint)
  return
  {
    layers =
    {
      {
        width = 193*2,
        height = 164*2,
        priority="very-low",
        frame_count = 24,
        direction_count = 16,
        shift = {scale * 1.01562 *2, 0},
        scale = scale,
        still_frame = 4,
        stripes =
        {
          {
            filename = modgraphics .. "entity/spitter/spitter-run-1.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-3.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-5.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-6.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      },
      {
        width = 193*2,
        height = 164*2,
        priority = "very-low",
        frame_count = 24,
        direction_count = 16,
        shift = {scale * 1.01562 *2, 0},
        scale = scale,
        still_frame = 4,
        draw_as_shadow = true,
        stripes =
        {
          {
            filename = modgraphics .. "entity/spitter/spitter-run-1-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-2-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-3-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-4-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-5-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-run-6-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      },
      {
        width = 81*2,
        height = 90*2,
        frame_count = 24,
        direction_count = 16,
        shift = {scale * 0.015625 *2, scale * -0.6875 *2},
        scale = scale,
        filename = modgraphics .. "entity/spitter/spitter-run-mask.png",
        flags = { "mask" },
        tint = tint
      }
    }
  }
end

function old_spitterdyinganimation(scale, tint)
  return
  {
    layers =
    {
      {
        width = 225*2,
        height = 174*2,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.546875 *2, scale * 0.21875 *2},
        priority = "very-low",
        scale = scale,
        stripes =
        {
          {
            filename = modgraphics .. "entity/spitter/spitter-die-1.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-3.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      },
      {
        width = 225*2,
        height = 174*2,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.546875 *2, scale * 0.21875 *2},
        priority = "very-low",
        scale = scale,
        draw_as_shadow = true,
        stripes =
        {
          {
            filename = modgraphics .. "entity/spitter/spitter-die-1-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-2-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-3-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-4-shadow.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      },
      {
        flags = { "mask" },
        width = 166*2,
        height = 144*2,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0 *2, scale * -0.0625 *2},
        priority = "very-low",
        tint = tint,
        scale = scale,
        stripes =
        {
          {
            filename = modgraphics .. "entity/spitter/spitter-die-mask-1.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-mask-2.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-mask-3.png",
            width_in_frames = 8,
            height_in_frames = 8
          },
          {
            filename = modgraphics .. "entity/spitter/spitter-die-mask-4.png",
            width_in_frames = 8,
            height_in_frames = 8
          }
        }
      }
    }
  }
end

