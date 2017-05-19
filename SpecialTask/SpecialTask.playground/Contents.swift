    
    class Fruit{
        var name:String
        
        init(name:String) {
            self.name = name;
        }
    }
    
    class Iterator{
        var container = [Fruit]()
        var count = 0
        var index = 0
        
        init(container:[Fruit]){
            self.container = container
            self.count = container.count
        }
        
        func hasNext() -> Bool{
            if (index < count){
                return true
            }
            else{
                return false
            }
        }
        
        func next() -> Fruit{
            index += 1
            return container[index-1]
        }
    }


    class Basket{
        var basket = [Fruit]()
        
        
        
        func add(fruit:Fruit){
            basket.append(fruit);
        }
        
        func getIterator() -> Iterator{
            let iterator:Iterator = Iterator(container:basket)
            return iterator
        }
        
    }
    
    
    var frut1 = Fruit(name:"Apple")
    var frut2 = Fruit(name:"Orange")
    var frut3 = Fruit(name:"Banana")
    
    var basket = Basket()
    basket.add(fruit: frut1)
    basket.add(fruit: frut2)
    basket.add(fruit: frut3)
    
    var iterator = basket.getIterator()
    
    while(iterator.hasNext()){
        var frut = iterator.next()
        print(frut.name)
    }
    
    
    