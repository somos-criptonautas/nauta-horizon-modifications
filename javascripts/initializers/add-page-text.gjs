import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  api.renderInOutlet(
    "OUTLET_NAME_HERE",
    <template>
      <div class="custom-page-intro">
        Your custom text here
      </div>
    </template>
  );
});