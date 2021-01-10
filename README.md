# bash-tools
Set of includable tools to simplify and improve bash coding

* [dataset](#dataset)
	* [dataset::match](#datasetmatch)

----

# dataset

Works with associative arrays;
Before use you need to declare the variable as an associative array with `declare -A myvar` then pass to function the var name as a string.

The indexes must start with characters from A-Z, a-z and 0-9 and can have any characters except equal sign `=` and spaces

The values can have any characters, however spaces and tabs are removed from start and end of the string.

**Gotchas**

* When using returned values for loops use always `"${myvar[@]}"` encapsulated in double quotes and using `@` or you can have unexpected results.

## dataset::read

Read a file converting its contents to an associative array;

File example in 'test/example.conf':
```
# It is a conf commentary line!
itsa.key1 = apple
itsa key2 = invalid line...
Key1      = remains = as = value
2key      = $HOME 
```

Call example:
```bash
declare -A X=$( dataset::read example.conf )
for i in "${!X[@]}"; do
	echo "Key: ($i) / Value: (${X[$i]})";
done
```

Results in: 
```
Key: (2key) / Value: (/your/home/folder)
Key: (itsa.key1) / Value: (apple)
Key: (Key1) / Value: (remains = as = value)
```

## dataset::match

Get all the indexes of an associative array starting with the string.

```bash
for i in $(dataset::match X 'itsa') ; do
	echo "Key: ($i) / Value: (${X[$i]})";
done

```
Results in:
```
Key: (itsa.key1) / Value (apple)
```

You can also use bash patterns on match:

```bash
for i in $(dataset::match X '[kK]ey' ) ; do
	echo "Key: ($i) / Value (${X[$i]})";
done
```

Results in:
```
Key: (key2) / Value ()
Key: (Key1) / Value (remains = as = value)
```
