use_bpm 60

# Define a quick fade-in for synths
define :fade_in do |synth, duration, max_amp|
  steps = 10
  step_duration = duration / steps.to_f
  amp_values = (1..steps).map { |i| max_amp * i / steps.to_f }
  amp_values.each do |amp|
    control synth, amp: amp, amp_slide: step_duration
    sleep step_duration
  end
end

# Define ambient drone with variations
define :ambient_drone do |initial=false|
  use_synth :dark_ambience
  duration = initial ? 4 : 1
  synth = play choose([:c2, :d2, :e2]), sustain: 16, amp: 0
  fade_in synth, duration, 2
  sleep 16
end

# Define soft melody with variations
define :soft_melody do |initial=false|
  use_synth :hollow
  notes = choose([[:c4, :e4, :g4, :b3, :a3, :g4],
                  [:d4, :f4, :a4, :c4, :b3, :a4],
                  [:e4, :g4, :b4, :d4, :c4, :b4]])
  duration = 1
  synths = notes.map { |note| play note, amp: 0, sustain: 2 }
  synths.each { |s| fade_in s, duration, 2 }
  sleep 12
end

# Define reflective bass with variations
define :reflective_bass do |initial=false|
  use_synth :dark_ambience
  duration = 1
  synth1 = play choose([:c2, :d2, :e2]), release: 8, amp: 0
  fade_in synth1, duration, 2
  sleep 8
  synth2 = play choose([:g2, :a2, :b2]), release: 8, amp: 0
  fade_in synth2, duration, 2
  sleep 8
end

# Define soft chords with variations
define :soft_chords do |initial=false|
  use_synth :hollow
  duration = 1
  synth1 = play_chord choose([[:c4, :e4, :g4],
                              [:a3, :c4, :e4],
                              [:d4, :f4, :a4]]), sustain: 8, amp: 0
  fade_in synth1, duration, 2
  sleep 8
  synth2 = play_chord choose([[:a3, :c4, :e4],
                              [:b3, :d4, :f4],
                              [:g3, :b3, :d4]]), sustain: 8, amp: 0
  fade_in synth2, duration, 2
  sleep 8
end

# Define ethereal lead with variations
define :ethereal_lead do |initial=false|
  use_synth :hollow
  notes = choose([[:e5, :d5, :c5, :b4, :a4],
                  [:f5, :e5, :d5, :c5, :b4],
                  [:g5, :f5, :e5, :d5, :c5]])
  duration = 1
  synths = notes.map { |note| play note, amp: 0, sustain: 2 }
  synths.each { |s| fade_in s, duration, 2 }
  sleep 12
end

# Live loops with smooth transitions and variations
live_loop :ambient_drone_loop do
  ambient_drone tick == 0
end

live_loop :soft_melody_loop do
  soft_melody tick == 0
end

live_loop :reflective_bass_loop do
  reflective_bass tick == 0
end

live_loop :soft_chords_loop do
  soft_chords tick == 0
end

live_loop :ethereal_lead_loop do
  ethereal_lead tick == 0
end
