. $(realpath $(dirname $0)/../src/dataset.sh)
echo -e "\n\n### dataset:read"
declare -A X=$(dataset::read example.conf)

echo ${X[@]}
for i in ${!X[@]}; do
	echo $i contains ${X[$i]};
done

echo -e "\n\n### dataset::match"
for i in $(dataset::match X 'itsa.') ; do
	echo "1st call <<$i>> -> ${X[$i]}";
done

for i in $(dataset::match X 'key' ) ; do
	echo "2nd call <<$i>> -> ${X[$i]}";
done
