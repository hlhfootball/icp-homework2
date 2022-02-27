import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Order "mo:base/Order";
import Array "mo:base/Array";

actor{
    func quicksort(array: [var Nat], low: Nat, high: Nat){
        if(low > high){
            return;
        };

        var l = low;
        var h = high;
        let key = low;

        while(l < h){
            while((array[l] < array[key]) and (l < high)){
                l+=1;
            };
            
            while(array[h] > array[key]){
                h-=1;
            };

            if(l < h){
                Debug.print("l is " # Nat.toText(l) # " array[l] is " # Nat.toText(array[l]));
                Debug.print("h is " # Nat.toText(h) # " array[h] is " # Nat.toText(array[h]));
                Debug.print("key is " # Nat.toText(key));
                let temp = array[l];
                array[l] := array[h];
                array[h] := temp;
            };
            //Debug.print(debug_show(array));
        };
        let temp3 = array[key];
        array[key] := array[h];
        array[h] := temp3;
        if(h > 0)
        {
            quicksort(array, low, h - 1);
        };
        quicksort(array, h + 1, high);
    };

    public func QSort(arr: [Nat]): async [Nat]{
        let lenth = arr.size();
        if(lenth < 2){
            return arr;
        }
        else{
            let result: [var Nat] = Array.thaw(arr): [var Nat];
            quicksort(result, 0, lenth - 1);
            return Array.freeze(result);
        };
    };
/*
        //let a: [Nat] = [3,5,1,2,7];
        let a: [Nat] = [7,9,2,99,0];
        Debug.print(debug_show(a));
        let b: [Nat] = QSort(a);
        Debug.print(debug_show(b));
*/
/*
    func fib(n: Nat): Nat{
        if(n <= 1){
            1;
        }else{
            fib(n - 2) + fib(n - 1);
        }

    };

    public func fibonacci(x: Nat): async Nat{
        fib(x);
    }
*/
}
