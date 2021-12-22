## チルダ表記 `~`

明記したところ以下のバージョンがあがることのみ許容

> Allows patch-level changes if a minor version is specified on the comparator. Allows minor-level changes if not.

- ~1.1.2 = 1.1.2 <= version < 1.2.0
- ~1.1 = 1.1.x
- ~1 = 1.x

## キャレット表記 `^`

一番左側にある、ゼロでないバージョンは変えない

- ^1.2.3 := 1.2.3 <= version < 2.0.0
- ^0.2.3 := 0.2.3 <= version < 0.3.0
- ^0.0.3 := 0.0.3 <= version < 0.0.4

> Allows changes that do not modify the left-most non-zero digit in the [major, minor, patch] tuple.
