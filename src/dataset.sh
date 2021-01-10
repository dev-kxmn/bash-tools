# Usage: dataset::read "varname" "conffile"
# Read a file to an associative array from lines:
# `pair = complex value`
dataset::read() {

	awk '
		BEGIN {
			RS="[[:space:]]*[\n\r]";        # Trim end whitespace
			FS="[[:space:]]*=[[:space:]]*"; 
			printf "( " , ""
		};
		/^[[:alnum:]][^[:space:]]+[[:space:]]*=[[:space:]]*/ {
			{
				str=$0; key=$1; $1=""; printf "[\"%s\"]=", key; 
				match(str, FS); printf "\"%s\" ", substr(str, RSTART+RLENGTH, length(str));
				next;
			}
		}
		{next}
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
