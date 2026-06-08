// {theme}/javascripts/discourse/api-initializers/init-theme.gjs
import { apiInitializer } from "discourse/lib/api";


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

    // Monkey code to order groups
    api.onPageChange((url) => {
        if (!url.startsWith("/g/")) return;

        document.querySelector(".group-info-name")
            ?.childNodes
            .forEach((node) => {
                if (node.nodeType === Node.TEXT_NODE)
                    node.textContent = node.textContent.replace(/\[.*?\]/g, "").trim();
            });
    });

});