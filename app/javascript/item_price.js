window.addEventListener('turbolinks:load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",()=> {
    const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = inputValue / 10
  const profitPrice = document.getElementById("profit");
  profitPrice.innerHTML = inputValue - inputValue /10
    
  });
});