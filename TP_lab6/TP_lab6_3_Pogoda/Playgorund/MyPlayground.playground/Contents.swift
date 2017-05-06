var j = 2

(5 + 6 * j)

for i in 0 ..< 5 {
    
    j += j * i
    
}

j

print("result: \(j)")

//One row comment
/*Many
 row 
 comment*/

let a = 1
let b = 2
var c = 3
c = 32

var str:String = "Hello"
var dob:Double = 32.5

func func0() {
    print("hello from func0")
}

func func2(number: Int) ->String {
    return "number ==\(number)"
}

func0()
print(func2(number:234))


