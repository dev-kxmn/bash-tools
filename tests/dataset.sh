PDIR=$(realpath $(dirname $0)/../)
. $PDIR/src/dataset.sh
declare -A X=$(dataset::read $PDIR/tests/example.conf)

echo -e "\n\n### dataset:read"
for i in "${!X[@]}"; do
	echo "Key: ($i) / Value: (${X[$i]})";
done

echo -e "\n\n### Filtered by keys started with 'itsa.'"
for i in $(dataset::match X 'itsa.') ; do
	echo "Key: ($i) / Value: (${X[$i]})";
done

echo -e "\n\n### Filtered by keys started with '[Kk]ey'"
for i in $(dataset::match X '[kK]ey' ) ; do
	echo "Key: ($i) / Value: (${X[$i]})";
done
