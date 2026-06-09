// {theme}/javascripts/discourse/api-initializers/init-theme.gjs
import { apiInitializer } from "discourse/lib/api";
import { schedule } from "@ember/runloop";

function cleanGroupNames() {
  document.querySelectorAll(".group-info-name").forEach((el) => {
    el.childNodes.forEach((node) => {
      if (node.nodeType === Node.TEXT_NODE) {
        node.textContent = node.textContent.replace(/\[.*?\]/g, "").trim();
      }
    });
  });
}

export default apiInitializer((api) => {

  // Replace some icons
  api.replaceIcon("robot", "lightning");
  api.replaceIcon("language", "translate");
  api.replaceIcon("pencil", "note-pencil");

  // Do not display closed groups buttons
  const hideClosedButtons = () => {
    document.querySelectorAll(".group-membership-button").forEach((button) => {
      const text = button.textContent.trim().toLowerCase();
      if (text === "closed" || text === "cerrado") {
        button.style.display = "none";
      }
    });
  };

  api.onPageChange(() => {
    hideClosedButtons();
  });

  // Navigation not dropdown on mobile
  api.registerValueTransformer("navigation-bar-dropdown-mode", () => {
    return false;
  });

  // Clean [XX] from group names on /g and /g/groupname
  const router = api.container.lookup("router:main");
  router.on("routeDidChange", () => {
    const url = router.currentURL;
    if (!url?.startsWith("/g")) return;
    schedule("afterRender", cleanGroupNames);
  });

});