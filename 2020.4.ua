# AoC 2020 day 4 #

Data ← (⊜(□map ⊜(⊙□°$"_:_") ¬⊸∈"\n\s") ¬⊸⦷"\n\n" &fras"2020.4.in")

Check ← /↧⨬(
  ↧⊓≥≤1920,2002⋕                              # birth year
| ↧⊓≥≤2010,2020⋕                              # issue year
| ↧⊓≥≤2020,2030⋕                              # expiration year
| ⍣(↧⊓≥≤150,193⋕°$"_cm"|↧⊓≥≤59,76⋕°$"_in"|0◌) # height
| ⍣(/↧∈"0123456789abcdef"°$"#_"|0◌)           # hair color
| ∈{"amb""blu""brn""gry""grn""hzl""oth"}      # eye color
| ↧⊃(⍣(1◌⋕|0◌)|=9◇⧻)                          # passport id
| 1◌                                          # country id
)°⊏≡get⊙¤{
  "byr" # birth year
  "iyr" # issue year
  "eyr" # expiration year
  "hgt" # height
  "hcl" # hair color
  "ecl" # eye color
  "pid" # passport id
  "cid" # country id
}

$A ⧻⊚ ≡◇(=8⧻) ⍚(insert "cid" "000") Data
$B ⧻⊚ ≡◇(⨬⋅0Check =8⊸⧻) ⍚(insert "cid" "000") Data
