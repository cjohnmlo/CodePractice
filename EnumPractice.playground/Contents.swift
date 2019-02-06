enum MyOptional<E: Any>: ExpressibleByNilLiteral {
    
    case none
    case some(E)
    
    func unwrap() -> Any {
        switch self {
        case .none:
            print("nil when unwrapping")
        case .some(let val):
            return val
        }
        return MyOptional.none
    }
    
    init() {
        self = .none
    }
    
    init(_ value: E) {
        self = .some(value)
    }
    
    private init(val: E) {
        self = .some(val)
    }
    
    public init(nilLiteral: ()) {
        self = .none
    }
}

postfix operator >?

postfix func >? <E>(value: MyOptional<E> ) -> Any {
    return value.unwrap()
}


let myoptional : MyOptional<Any> = nil
var optional = MyOptional("Stringggg")
var myOptional : String? = nil
