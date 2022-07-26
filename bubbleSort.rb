def bubble_sort(arr)
    (arr.size-1).downto(0) { |sortedCounter|
        change=false         
        for workCounter in 0..sortedCounter-1
            arr[workCounter],arr[workCounter+1]=arr[workCounter+1],arr[workCounter] if arr[workCounter]>arr[workCounter+1]
            change = true
        end
        break if change==false #if no changes the list is already sorted
    }
        
arr    
end

p bubble_sort([4,3,12,8,9,78,2,0,2])