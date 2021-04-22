window.addEventListener('load', () => {

  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById('add-tax-price')
    //手数料10%
    let addFee = 0.1
    //販売手数料
    addTaxDom.innerHTML = (inputValue * addFee)
    
    let profit = inputValue * addFee
    const salesProfit = document.getElementById('profit')
    //販売利益
    salesProfit.innerHTML = (inputValue - profit)
  })
});