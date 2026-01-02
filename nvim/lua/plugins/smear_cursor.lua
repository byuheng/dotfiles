return {
  'sphamba/smear-cursor.nvim',
  opts = {
    -- 1. Essential Visuals
    legacy_computing_symbols_support = true, -- Smooths the blocks for JetBrains Mono
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    smear_insert_mode = true,

    -- 2. Performance (Optimized for 239Hz)
    -- 4ms matches your hardware frame time almost perfectly
    time_interval = 4,

    -- 3. Balanced Dynamics (The "Standard" Feel)
    stiffness = 0.6, -- Not too snappy, not too floaty
    trailing_stiffness = 0.5, -- HIGHER: Keeps the tail shorter (standard look)
    trailing_exponent = 2, -- LOWER: A more natural, rounded taper
    damping = 0.75, -- More control, less "bounce" than Fire Hazard

    -- 4. Visual Blending
    gamma = 0.4,
    gradient_exponent = 2.0, -- Standard smooth color fade
    distance_stop_animating = 0.1,

    -- 5. Foot/Gruvbox Background Sync
    -- Prevents the "blocky shadow" on your Gruvbox background
    transparent_bg_fallback_color = '#1D2021',
  },
}
