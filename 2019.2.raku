# AoC 2019 day 2 #

my $input = "2019.2.in".IO.slurp;

my @mem = $input.split(",").map({.Int});
@mem[1] = 12;
@mem[2] = 2;

my $pc = 0;
while True {
	my $opcode = @mem[$pc];
	given $opcode {
		when 99 { last }
		when 1 {
			my ($a, $b, $c) = (@mem[$pc+1], @mem[$pc+2], @mem[$pc+3]);
			@mem[$c] = @mem[$a] + @mem[$b];
		}
		when 2 {
			my ($a, $b, $c) = (@mem[$pc+1], @mem[$pc+2], @mem[$pc+3]);
			@mem[$c] = @mem[$a] * @mem[$b];
		}
	}
	$pc += 4;
}

say "A: @mem[0]";
