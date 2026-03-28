document.addEventListener("DOMContentLoaded", () => {
  const input = document.getElementById("doc-filter");
  if (!input) {
    return;
  }
  const cards = Array.from(document.querySelectorAll(".doc-card"));
  input.addEventListener("input", () => {
    const needle = input.value.trim().toLowerCase();
    for (const card of cards) {
      const haystack = card.getAttribute("data-search") || "";
      const show = !needle || haystack.includes(needle);
      card.style.display = show ? "" : "none";
    }
  });
});
