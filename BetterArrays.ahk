/************************************************************************
 * @description More methods for AHK arrays.
 * @author @Myurius
 * @date 2025/07/11
 * @version 0.1.0
 **********************************************************************
 */

class __Array extends Array {
    static __New() {
        super.Prototype.DefineProp("Contains", {Call: (self, Item) => this.Contains(self, Item)})
        super.Prototype.DefineProp("Join", {Call: (self, Delimiters := ",") => this.Join(self, Delimiters)})
        super.Prototype.DefineProp("Reverse", {Call: (self) => this.Reverse(self)})
        super.Prototype.DefineProp("ForEach", {Call: (self, Function) => this.ForEach(self, Function)})
    }

    static Contains(self, Item) {
        for k, v in self
            if v = Item
                return k
    }

    static Join(self, Delimiters := ",") {
        str := ""
        for k, v in self
           str .= v (k != self.Length ? Delimiters : "") 
        return str
    }

    static Reverse(self) {
        arr := []
        for k in self 
            arr.InsertAt(1, k)
        return arr
    }

    static ForEach(self, Function) {
        for k, v in self
            (Function.MaxParams) > 1 ? Function(v, k) : (Function.MaxParams) = 1 ? Function(v) : Function() 
    }
}