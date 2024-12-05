# AoC 2015 Day 1 #

my $input = "2015.1.in".IO.slurp;

my ($p1, $p2, $enabled) = (0, 1, True);
for $input.match(/'('|')'/, :g) {
	$p1 += $_ ~~ '(' ?? 1 !! -1;
	$p2 += 1 if $enabled and $p1 >= 0;
	$enabled = False if $p1 < 0;
}

$p1 = $input.split("").map({$_ ~~ '(' ?? 1 !! $_ ~~ ')' ?? -1 !! 0}).sum;
$p1 = $input.split("").map({when '(' {1}; when ')' {-1}}).sum;

say "A: $p1";
say "B: $p2";
