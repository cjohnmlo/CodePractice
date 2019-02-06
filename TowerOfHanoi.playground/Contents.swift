//: Playground - noun: a place where people can play
// tower of hanoi solver (recursive implementation)

func hanoi(N: Int, source: String, temp: String, dest: String) {
    if N == 1 {
        print("Disk \(N) from \(source) to \(dest)")
    }
    else {
        hanoi(N:N-1, source: source, temp: dest, dest: temp)
        print("Disk \(N) from \(source) to \(dest)")
        hanoi(N: N-1, source: temp, temp: source, dest: dest)
    }
}

hanoi(N: 3, source: "a", temp: "b", dest: "c")
