if (location.pathname.match("tags")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("item_tag_include_tag_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("item_tag_include_tag_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
       
        const tagName = XHR.response.keyword;
        const searchResult = document.getElementById("search-result");
        tagName.forEach((tag) => {
          const childElement = document.createElement("div");
          childElement.setAttribute("class", "child");
          childElement.setAttribute("id", tag.id);
          childElement.innerHTML = tag.tag_name;
          searchResult.appendChild(childElement);
        });
      };
    });
  });
};