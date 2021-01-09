# Usage: dataset::read "varname" "conffile"
# Read a file to an associative array from lines:
# `pair = complex value`
dataset::read() {
	awk '
		BEGIN {
			RS="[\n\r]";
			FS="[[:space:]]*=[[:space:]]*";
			printf "( " , ""
		};

		!/^[[:space:]]*[^[:space:]]+[[:space:]]*=[[:space:]]*[^[:space:]]/ {next}
		{ printf "[\"%s\"]=\"%s\" ", $1, $2; next }
		END {
			printf ")", ""
		}
	' $1;
}

# Usage:
dataset::match() {
	declare x=$(eval echo' ${!'$1'[@]}' )
	for i in ${x[@]}; do if expr $i : $2 > /dev/null ; then echo $i; fi; done
}
