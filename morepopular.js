const morePopular = (array, size)=>{
    let newSet = new Set(array)
    let max = 0;
    let popularElements = []
    newSet.forEach(element => {
        let moreArrayPop = array.filter(el => el===element)
        if(moreArrayPop.length > max){
            max = moreArrayPop.length
            popularElements.push(moreArrayPop[0])
        }
    })
    return Math.min(...popularElements)

}

console.log(morePopular([34,31,34, 77,85], 1))