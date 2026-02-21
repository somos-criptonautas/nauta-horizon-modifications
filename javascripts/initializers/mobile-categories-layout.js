import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.0", (api) => {
  api.modifyClass("controller:discovery/categories", {
    pluginId: "horizon-mobile-categories",

    // Discourse reads this getter to decide which template to render.
    // By default it checks site.mobileView and picks mobile_category_page_style.
    // We override it to always use the desktop style so the full
    // categories + recent posts DOM is rendered on mobile too.
    get categoryPageStyle() {
      return this.siteSettings.desktop_category_page_style;
    },
  });
});
