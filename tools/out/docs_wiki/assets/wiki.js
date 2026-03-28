document.addEventListener("DOMContentLoaded", () => {
  const body = document.body;
  const toggleButtons = Array.from(document.querySelectorAll("[data-sidebar-toggle]"));
  const closeButtons = Array.from(document.querySelectorAll("[data-sidebar-close]"));
  const backdrop = document.querySelector("[data-sidebar-backdrop]");
  const setSidebarOpen = (open) => {
    body.classList.toggle("sidebar-open", open);
    for (const button of toggleButtons) {
      button.setAttribute("aria-expanded", open ? "true" : "false");
    }
  };
  for (const button of toggleButtons) {
    button.addEventListener("click", () => {
      setSidebarOpen(!body.classList.contains("sidebar-open"));
    });
  }
  for (const button of closeButtons) {
    button.addEventListener("click", () => setSidebarOpen(false));
  }
  if (backdrop) {
    backdrop.addEventListener("click", () => setSidebarOpen(false));
  }
  window.addEventListener("resize", () => {
    if (window.innerWidth > 980 && body.classList.contains("sidebar-open")) {
      setSidebarOpen(false);
    }
  });
  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && body.classList.contains("sidebar-open")) {
      setSidebarOpen(false);
    }
  });
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
