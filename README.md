# VariadicGenericsUtils

`VariadicGenericsUtils`は、可変長ジェネリックを使用して作成されたSwiftパッケージです。このパッケージは、異なる型の複数の引数を受け取り、それらを結合したり比較したりする機能を提供します。

## 使用方法

`VariadicGenericsUtils`パッケージは、以下の3つの主要な機能を提供します。

### `concat`

`concat`関数は、異なる型の引数を結合してタプルとして返すことができます。

```swift
import VariadicGenericsUtils

let result = concat(left: 1, true, 3, 4, right: 2, 3, 4, "5", 6)
print(result)
// 出力: (1, true, 3, 4, 2, 3, 4, "5", 6)
```

### `equal`

`equal`関数は、異なる型の引数を比較して等しいかどうかを判断することができます。

```swift
import VariadicGenericsUtils

let result = equal(left: 1, "2", 3, false, right: 1, "2", 3, false)
print(result)
// 出力: true
```

### `lessThan`

`lessThan`関数は、数値型の引数を比較して左側の値が右側の値よりも大きいかどうかを判断することができます。

```swift
import VariadicGenericsUtils

let result = lessThan(left: 0, 4.1, 2.2, right: 1, 4.2, 5.2)
print(result)
// 出力: true
```

## ライセンス

`VariadicGenericsUtils`はMITライセンスの下で配布されています。
