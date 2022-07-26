def stock_picker(values)
    result={} #comibnations {value(profit) => [daytobuy,daytosell]}
    buyIndex=0
    while buyIndex<values.size do
        buyPrice=values[buyIndex]
        sellIndexChecker=buyIndex+1
        sellIndex=nil
        profit=0
        while sellIndexChecker<values.size do
            if values[sellIndexChecker]-values[buyIndex]>=profit
                profit=values[sellIndexChecker]-values[buyIndex]
                sellIndex=sellIndexChecker
            end
            sellIndexChecker+=1
        end
        result[profit]=[buyIndex,sellIndex]
        buyIndex+=1
    end
    max=result.max_by{|k,v| k}
    return max[1]
end

p stock_picker([17,3,6,9,15,8,6,1,10])


