use_bpm 60

# Define soft chords with variations
define :soft_chords do
  use_synth :hollow
  play_chord choose([[:c4, :e4, :g4],
                     [:a3, :c4, :e4],
                     [:d4, :f4, :a4]]), sustain: 8, amp: 2
  sleep 8
  play_chord choose([[:a3, :c4, :e4],
                     [:b3, :d4, :f4],
                     [:g3, :b3, :d4]]), sustain: 8, amp: 2
  sleep 8
end

# Live loop to play soft chords continuously
live_loop :soft_chords_loop do
  soft_chords
end
