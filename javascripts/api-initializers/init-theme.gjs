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
});