const pay = ()=> {
  Payjp.setPublicKey("pk_test_73fe4c5fe0fc09d349f4bbaa"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", () => {
    console.log("イベント発火");
  })
}

window.addEventListener("load", pay);