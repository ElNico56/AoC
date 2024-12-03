# AoC 2024 day 3 #

my $input = "2024.3.in".IO.slurp;

my ($p1, $p2, $enabled) = (0, 0, True);

for $input.match(/"do()"|"don't()"|"mul("\d+","\d+")"/, :g) {
	when "do()"    { $enabled = True }
	when "don't()" { $enabled = False }
	when /"mul("(\d+)","(\d+)")"/ {
		my ($a, $b) = $/[0, 1].map(*.Int);
		$p1 += $a * $b;
		$p2 += $a * $b if $enabled;
	}
}

say "A: $p1";
say "B: $p2";
