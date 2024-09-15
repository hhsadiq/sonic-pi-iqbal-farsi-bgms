use_bpm 60

# Define a quick fade-in function for smooth transitions
define :fade_in do |synth, duration, max_amp|
  control synth, amp: max_amp, amp_slide: duration
end

# Define softer chords with more variations and subtle fade-ins
define :soft_chords do
  use_synth :hollow
  chord1 = play_chord choose([[:c4, :e4, :g4],
                              [:a3, :c4, :e4],
                              [:d4, :f4, :a4],
                              [:e3, :g3, :b3],
                              [:f3, :a3, :c4]]), sustain: 5, amp: 0
  fade_in chord1, 1, 1.2 # Softer volume for chords
  sleep 5
  chord2 = play_chord choose([[:a3, :c4, :e4],
                              [:b3, :d4, :f4],
                              [:g3, :b3, :d4],
                              [:c3, :e3, :g3],
                              [:d3, :f3, :a3]]), sustain: 5, amp: 0
  fade_in chord2, 1, 1.2 # Softer volume for chords
  sleep 5
end

# Define more prominent bass with variations and fade-ins
define :soft_bass do
  use_synth :fm
  bass1 = play choose([:c2, :a2, :d2]), release: 5, amp: 0
  fade_in bass1, 1, 2 # More prominent bass
  sleep 5
  bass2 = play choose([:g2, :b2, :f2]), release: 5, amp: 0
  fade_in bass2, 1, 2 # More prominent bass
  sleep 5
end

# Live loop to play soft chords continuously
live_loop :soft_chords_loop do
  soft_chords
end

# Live loop to play soft bass continuously
live_loop :soft_bass_loop do
  soft_bass
end
