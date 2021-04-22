window.addEventListener('load', () => {

  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById('add-tax-price');

    let fee = inputValue * 0.1;
    //手数料切り捨て
    let addFee = Math.floor(fee);
    //販売手数料
    addTaxDom.innerHTML = addFee.toLocaleString();
    
    let profit = inputValue - addFee;
    const salesProfit = document.getElementById('profit');
    //販売利益
    salesProfit.innerHTML = profit.toLocaleString();
  })
});