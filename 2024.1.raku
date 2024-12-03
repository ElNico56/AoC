# AoC 2024 day 1 #

my $input = "2024.1.in".IO.slurp;

my ($p1, $p2) = (0, 0);
my @l; my @r;
for $input.match(/(\d+)\s+(\d+)/, :g) -> $match {
	@l.push($match[0].Int);
	@r.push($match[1].Int);
}

for zip(@l.sort, @r.sort) -> ($a, $b) {
	$p1 += abs($a - $b);
}

for @l -> $v {
	my $count = 0;
	for @r -> $w { $count++ if $v == $w; }
	$p2 += $v * $count;
}

say "A: $p1";
say "B: $p2";
