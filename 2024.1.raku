# AoC 2024 day 1 #

my $input = "2024.1.in".IO.slurp;

my ($p1, $p2) = (0, 0);
my @L; my @R;
for $input.match(/(\d+)\s+(\d+)/, :g) {
	@L.push(.[0].Int);
	@R.push(.[1].Int);
}

$p1 = (@L.sort Z- @R.sort)>>.abs.sum;

for @L -> $v {
	my $count = 0;
	for @R -> $w { $count++ if $v == $w; }
	$p2 += $v * $count;
}

say "A: $p1";
say "B: $p2";
