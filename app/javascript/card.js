const pay = () => {
  Payjp.setPublicKey("pk_test_62eb1eec7127e3d242742d83"); 
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_item[number]"),
      cvc: formData.get("order_item[cvc]"),
      exp_month: formData.get("order_item[exp_month]"),
      exp_year: `20${formData.get("order_item[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);        
      }

      document.getElementById("order_item_number").removeAttribute("name");
      document.getElementById("order_item_cvc").removeAttribute("name");
      document.getElementById("order_item_exp_month").removeAttribute("name");
      document.getElementById("order_item_year").removeAttribute("name");
    });
  });
};

window.addEventListener("load", pay);