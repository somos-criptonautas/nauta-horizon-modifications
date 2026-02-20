import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  api.registerValueTransformer("navigation-bar-dropdown-mode", () => {
    return false;
  });
});
