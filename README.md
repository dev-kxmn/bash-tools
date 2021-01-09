# bash-tools
Set of includable tools to simplify and improve bash coding

* [dataset](#dataset)
	* [dataset::match](#datasetmatch)





## dataset

Works with associative arrays

### dataset::read

Read a file converting its contents to an associative array;

File example in 'test/example.conf':
```
# It is a conf commentary line!
itsa.key1 = apple
itsa.key2 = banana
key1      = cherry
key2      = durian
```

Call example:
```bash
declare -A X=$( dataset::read example.conf )
for i in ${!X[@]}; do
	echo $i contains ${X[$i]};
done
```

### dataset::match

Get all the indexes of an associative array starting with the string.

```bash
for i in $( dataset::match X 'itsa.') ; do
	echo 1st call matched $i with value ${X[$i]};
done

for i in $( dataset::match X 'key' ) ; do
	echo 2nd matched $i with value ${X[$i]};
done
