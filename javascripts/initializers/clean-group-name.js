import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("0.11.1", (api) => {
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